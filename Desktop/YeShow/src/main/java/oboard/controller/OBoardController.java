package oboard.controller;

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

import common.util.CommonUtil;
import oboard.model.OBoardVO;
import oboard.model.OPagingVO;
import oboard.model.OReplyVO;
import oboard.service.OBoardService;

@Controller
//@RequestMapping("/board")
public class OBoardController {
	
	
	@Autowired
	private OBoardService boardService;
	
	@Autowired
	CommonUtil util;
	
	private final String UP_DIR="C:/MyData/Upload";
	
	//m07-825-415
	
	private static final Logger log
		=LoggerFactory.getLogger(OBoardController.class);
	
	@RequestMapping(value="/board/write.do",
			method=RequestMethod.GET)
	public String writeForm(){
		return "oboard/boardWrite";
	}
	@RequestMapping(value="/board/write.do",
			method=RequestMethod.POST)
	public String insertBoard(Model model,
			@RequestParam("fileup") MultipartFile fileup,
			@ModelAttribute("board") OBoardVO board){
		/*[1] pom.xml에 commons-fileupload와 commons-io
		 * 를 등록하여 업로드 라이브러리를 다운로드받자.
		 * [2] mvc-config.xml에 multipartResolver빈 등록
		  ------------------------------------
		  <bean id="multipartResolver"
	 		class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
	   			<property name="maxUploadSize" value="-1"/>
	   			<!--파일 업로드 최대 용량을 무제한으로 주려면 -1 값을 준다. -->
				<property name="defaultEncoding" value="UTF-8"/>
			</bean>
	---------------------------------------------------
		 * */
		
		//1. 먼저 첨부파일을 업로드 하자.
		//첨부파일명, 파일크기 알아내기
		String filename=fileup.getOriginalFilename();//파일명
		long filesize=fileup.getSize();//첨부파일크기

		//업로드 처리=> transferTo(File객체)
		try{
			if(fileup!=null)
		fileup.transferTo(new File(UP_DIR,filename));
		////////////////////
		board.setFilename(filename); //db에 insert하기 위해
		board.setFilesize(filesize); //VO에 setting
		////////////////////
		
		}catch(IOException e){
			log.info("게시판 글쓰기 파일 업로드 실패: {}",
					e.getMessage());
		}
		
		int n=this.boardService.insertBoard(board);
		String msg=(n>0)?"글쓰기 성공":"글 쓰기 실패";
		String loc=(n>0)?"list.do":"javascript:history.back()";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "memo/message";
	}
	
	@RequestMapping("/list-old.do")
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
		
		List<OBoardVO> arr
		=boardService.selectBoardAll(map);
		model.addAttribute("boardList", arr);
		model.addAttribute("cpage",cpage);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageCount",pageCount);
		
		return "oboard/boardList";
	}
	@RequestMapping("/board/list.do")
	public String listBoardPaging (Model model,
	HttpServletRequest req,		
	HttpSession ses,		
	@ModelAttribute("paging") OPagingVO paging,		 
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
	
	//페이지 네비게이션 문자열을 반환하는 메소드 호출
	String myctx=req.getContextPath();
	String loc="board/list.do";
	String pageNavi=paging.getPageNavi(myctx,loc);
	
	List<OBoardVO> arr 
	= boardService.selectBoardAll(paging);
		
		model.addAttribute("boardList", arr);			
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging",paging);
		model.addAttribute("pageNavi",pageNavi);
		return "oboard/boardList3";
	}//----------------------
	
	@RequestMapping("/board/boardview.do")
	public String viewBoard(Model model,
			@RequestParam(defaultValue="0")int idx){
		log.debug("viewBoard: idx={}",idx);
		//조회 수 증가---------
		boolean isUp=boardService.updateReadnum(idx);
		
		//글번호로 해당 글 내용 가져오기
		OBoardVO board
		=boardService.selectBoardByIdx(idx);
		model.addAttribute("board",board);
		
		//꼬리글 목록 가져오기---
		List<OReplyVO> rList
		=boardService.selectReplyAll(idx);
		model.addAttribute("rList",rList);
		//꼬리글 갯수 가져오기
		int rCount=boardService.selectReplyCount(idx);
		model.addAttribute("rCount",rCount);
		
		return "oboard/boardView";
	}//----------------------------
	
	@RequestMapping(value="/board/pForm.do",
			method=RequestMethod.POST)
	public String inputPwdForm(Model model,
			@RequestParam("idx2") int idx,
			@RequestParam(defaultValue="0") int mode)
	{
		log.debug("inputPwdForm(): idx={}", idx);
		if(mode==0){
			model.addAttribute("msg","잘못 들어온 경로입니다");
			String loc="javascript:history.back()";
			model.addAttribute("loc",loc);
			return "memo/message";
		}
		String title=(mode==1)?"글 수정":"글 삭제";
		model.addAttribute("mode",mode);
		model.addAttribute("title",title);
		model.addAttribute("idx",idx);
		return "oboard/boardPwd";
	}
	
	@RequestMapping(value="/board/delete.do",
			method=RequestMethod.POST)
	public String deleteBoard(Model model,
			@RequestParam(defaultValue="0") int idx,
			@RequestParam(defaultValue="") String pwd)
	{
		log.debug("deleteBoard(): idx={}, pwd={}",idx,pwd);
		String msg="", loc="";
		String dbPwd=boardService.selectPwd(idx);
		if(pwd.equals(dbPwd)){//비번 일치시 삭제 처리
			int n=boardService.deleteBoard(idx);
			msg=(n>0)?"글 삭제 성공":"글 삭제 실패";
			loc="list.do";
		}else{
			//비밀번호 불일치-메시지 처리
			msg="비밀번호가 틀려요";
			loc="javascript:history.back()";
		}
		return util.addMsgLoc(model,msg,loc);
		
	}
	
	//글 수정 form보여주기
	@RequestMapping("/board/editForm.do")
	public String editForm(Model model,
			@RequestParam(defaultValue="0") int idx,
			@RequestParam(defaultValue="")String pwd){
		if(idx==0||pwd.isEmpty()){
			return "redirect:/oboard/list.do";
		}
		String dbPwd=boardService.selectPwd(idx);
		String msg="", loc="";
		if(!pwd.equals(dbPwd)){
			msg="비밀번호가 일치하지 않아요";
			return util.addMsgBack(model,msg);
		}
		//비번이 맞다면 해당 글 내용가져와 보여주기
		OBoardVO board=boardService.selectBoardByIdx(idx);
		
		model.addAttribute("board",board);
		
		return "oboard/boardEdit";
	}//------------------------
	/**글 수정 처리*/
	@RequestMapping(value="/board/editEnd.do",
			method=RequestMethod.POST)
	public String editEnd(Model model,
		@RequestParam("fileup") MultipartFile fileup,
		@ModelAttribute("board") OBoardVO board){
		//1. 파일 업로드 처리
		String filename=fileup.getOriginalFilename();
		long filesize=fileup.getSize();
		if(filesize>0){//첨부파일이 있다면
			//예전에 업로드한 파일은 삭제처리(hidden data)
			String oldFile=board.getFilename();
			if(oldFile!=null && !oldFile.isEmpty()){
				File delFile=new File(UP_DIR,oldFile);
				boolean isDel=delFile.delete();
				log.info("파일 삭제 여부: {} ",isDel);
			}
		}//if-------------
		try{
			//업로드 처리
			if(fileup!=null)
				fileup.transferTo(new File(UP_DIR,filename));
			board.setFilename(filename);
			board.setFilesize(filesize);
			
		}catch(IOException e){
			log.debug("업로드 실패: {}",e);
		}
		//2. DB에 수정 처리
		int n=boardService.updateBoard(board);
		
		String msg=(n>0)? "수정 성공":"수정 실패";
		String loc=(n>0)? "list.do":
					"javascript:history.back()";
		
		return util.addMsgLoc(model,msg,loc);
	}//----------------
	
	@RequestMapping("/board/rewrite.do")
	public String rewriteForm(Model model,
			@RequestParam(defaultValue="0")int idx,
			@RequestParam(defaultValue="") String subject){
		if(idx==0){
			return "redirect:list.do";
		}
		model.addAttribute("idx",idx);
		model.addAttribute("subject",subject);
		return "oboard/boardRewrite";
		
	}//----------
	
	@RequestMapping(value="/board/rewriteEnd.do",
			method=RequestMethod.POST)
	public String rewriteEnd(Model model,
			@RequestParam("fileup") MultipartFile fileup,
			@ModelAttribute("board") OBoardVO board){
		//1. 파일 업로드 처리
		
		String filename=fileup.getOriginalFilename();
		long filesize=fileup.getSize();
		
		try {
			if(fileup!=null)
				fileup.transferTo(new File(UP_DIR,filename));
			board.setFilename(filename);
			board.setFilesize(filesize);
			
		} catch (IOException e) {
			log.debug("답변글 파일 업로드 실패: {}",e);
		}
		//2. db에 답변글 insert
		int n=boardService.rewriteBoard(board);
		
		String msg=(n>0)?"답글 쓰기 성공":"답글 쓰기 실패";
		String loc=(n>0)?"list.do":"javascript:history.back()";
		return util.addMsgLoc(model, msg, loc);
		
		
	}
	
}////////////////////////////////



















