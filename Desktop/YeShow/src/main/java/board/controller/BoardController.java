package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.model.BoardVO;
import board.model.FileVO;
import board.model.PagingVO;
import board.service.BoardService;
import common.util.CommonUtil;
import ye.model.MemberVO;



@Controller

public class BoardController {

	
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	CommonUtil util;
	
	private final String UP_DIR="C:/MyData/Upload";
	

	
	private static final Logger log
		=LoggerFactory.getLogger(BoardController.class);
	
	
	@RequestMapping(value="/write.do",
			method=RequestMethod.GET)
	public String writeForm(){
		return "Board/boardWrite";
	}
	
	@RequestMapping(value="/write.do",
			method=RequestMethod.POST)
	
	
	public String insertBoard(Model model,
		@RequestParam("fileup") MultipartFile fileup,
		@ModelAttribute("Board") BoardVO Board,
		@ModelAttribute("File") FileVO File){
		
		
		String filename=fileup.getOriginalFilename();//파일명
		
		try{
			if(fileup!=null)	
				fileup.transferTo(new File(UP_DIR,filename));
			////////////////////
			File.setFname(filename);
			
			////////////////////
			
			}catch(IOException e){
				log.info("게시판 글쓰기 파일 업로드 실패: {}",
						e.getMessage());
			}
		
		int n=this.boardService.insertBoard(Board);
		
		String msg=(n>0)?"글쓰기 성공":"글 쓰기 실패";
		String loc=(n>0)?"NewboardList.do":"javascript:history.back()";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "memo/message";
		
	}
	
	//페이징 처리 및 게시판 - old
	@RequestMapping("/boardList.do")
	public String listBoard(Model model,
			@RequestParam(defaultValue="1") int cpage,
			@RequestParam(defaultValue="5") int pageSize){
		
		if(cpage<0){
			cpage=1;
		}
		int totalCount=boardService.getTotalCount();
		int pageCount=(totalCount-1)/pageSize+1;
		
		if(cpage>pageCount){
			cpage=pageCount;
			
		}
		
		int end=cpage*pageSize;
		int start=end-(pageSize-1);
		
		  
		Map<String,Integer> map
		=new HashMap<String,Integer>();
		map.put("start",start);
		map.put("end",end);
		
		List<BoardVO> arr
		=boardService.selectBoardAll(map);
		model.addAttribute("boardList", arr);
		model.addAttribute("cpage",cpage);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);
		
		return "Board/boardList";
	}

	//paging처리 new
	@RequestMapping("/NewboardList.do")
	public String listBoardPaging (Model model,
	HttpServletRequest req,		
	HttpSession ses,		
	@ModelAttribute("paging") PagingVO paging,		 
	@RequestParam(defaultValue="0") int pageSize){
	
	if(pageSize==0){
		Integer ps=(Integer)ses.getAttribute("pageSize");
		if(ps==null){
			pageSize=5;
			;
		}else{
			pageSize=ps;
		}
	}
	//세션에 pageSize를 저장하자.	
	ses.setAttribute("pageSize",pageSize);
	
	int totalCount=boardService.getTotalCount(paging);
	paging.setTotalCount(totalCount);
	paging.setPageSize(pageSize);
	paging.init();
	//페이징 관련 연산을 수행하는 메소드 호출
	
	log.debug("Page={}", paging);
	
	//페이지 네비게이션 문자열을 반환하는 메소드 호출
	String myctx=req.getContextPath();
	String loc="NewboardList.do";
	String pageNavi=paging.getPageNavi(myctx,loc);
	
	List<BoardVO> arr 
	= boardService.selectBoardAll(paging);
		
		model.addAttribute("boardList", arr);			
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging",paging);
		model.addAttribute("pageNavi",pageNavi);
		return "Board/NewboardList";
	}//----------------------
	
	
	//글 내용 보기
	@RequestMapping("/view.do")
	public String viewBoard(Model model,
			@RequestParam(defaultValue="0")int mb_num){
		
	//조회 수 증가---------
	boolean isUp=boardService.updatemb_hits(mb_num);
	
	//추천 수 증가---------
	/**글 수정 처리*/
	
	
	
		
	//글번호로 해당 글 내용 가져오기
	BoardVO board
	=boardService.selectBoardBymb_num(mb_num);
	model.addAttribute("board",board);
	
		return "Board/boardView";
	}//----------------------------
	
	//글 수정 form보여주기
		@RequestMapping("/editForm.do")
		public String editForm(Model model,
				@RequestParam(defaultValue="0") int mb_num){
			
		
			BoardVO board=boardService.selectBoardBymb_num(mb_num);
			model.addAttribute("board",board);
			
			return "Board/boardEdit";
		}//------------------------
	
	
	
	/**글 수정 처리*/
	@RequestMapping(value="/editEnd.do",
			method=RequestMethod.POST)
	public String editEnd(Model model,
			@ModelAttribute("Board") BoardVO Board){
		//DB에 수정 처리
		int n=boardService.updateBoard(Board);
				
		String msg=(n>0)? "수정 성공":"수정 실패";
		String loc=(n>0)? "NewboardList.do":
			"javascript:history.back()";
		
		return util.addMsgLoc(model,msg,loc);
		
	}

	//글 삭제  
	@RequestMapping(value="/delete.do",
			method=RequestMethod.POST)
	public String deleteBoard(Model model, HttpSession ses,
			@RequestParam(defaultValue="0") int mb_num
			/*,@RequestParam(defaultValue="") String pwd*/){
		log.debug("deleteBoard(): idx={}",mb_num/*, pwd*/);
		
	/*	패스워드 한번 더 입력하고 싶을 때 수정해서 사용하기
	 * 
	 * 
		//1. 로그인한 사람의 회원번호 가져오기
		MemberVO loginUser=(MemberVO)ses.getAttribute("loginUser");
		int idx=loginUser.getIdx();
		//2. 로그인한 회원의 패스워드 가져오기
		String idxpwd=boardService.selectPwd(idx);//회원의 패스워드
		if(pwd.equals(idxpwd)){//비번 일치시 삭제처리

		}*/
			
		int n=boardService.deleteBoard(mb_num);
		String msg="글 삭제 성공", loc="NewboardList.do";
		
	
		return util.addMsgLoc(model,msg,loc);
	}
}
