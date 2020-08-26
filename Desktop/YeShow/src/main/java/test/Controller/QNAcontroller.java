package test.Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
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

import test.model.ImgVO;
import test.model.NoteVO;
import test.model.PagingVO;
import test.service.NoteService;

@Controller
public class QNAcontroller {

	@Autowired
	private NoteService noteService;
		
	private static final Logger log	= LoggerFactory.getLogger(QNAcontroller.class);
	
	@RequestMapping("/qna.do")
	public String qna(){
		return "complain/pqnaEnd";
	}
	
	@RequestMapping(value="/qnaEnd.do", method=RequestMethod.POST)
	public String qnaEnd(Model model,
			@ModelAttribute("qna") NoteVO qna,
			@RequestParam("mqna_Img1") MultipartFile mqna_Img1,
			@RequestParam("mqna_Img2") MultipartFile mqna_Img2,
			@RequestParam("mqna_Img3") MultipartFile mqna_Img3,
			@RequestParam("mqna_Img4") MultipartFile mqna_Img4,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		ServletContext ctx = session.getServletContext();
		String UP_DIR = ctx.getRealPath("/upload");
		
		String filename1 = mqna_Img1.getOriginalFilename();
		String filename2 = mqna_Img2.getOriginalFilename();
		String filename3 = mqna_Img3.getOriginalFilename();
		String filename4 = mqna_Img4.getOriginalFilename();
		
		try {
			if(mqna_Img1 != null){
				mqna_Img1.transferTo(new File(UP_DIR, filename1));
				qna.setQna_Img1(filename1);
			}
			if(mqna_Img2 != null){
				mqna_Img2.transferTo(new File(UP_DIR, filename2));				
				qna.setQna_Img2(filename2);
			}
			if(mqna_Img3 != null){
				mqna_Img3.transferTo(new File(UP_DIR, filename3));
				qna.setQna_Img3(filename3);
			}	
			if(mqna_Img4 != null){
				mqna_Img4.transferTo(new File(UP_DIR, filename4));
				qna.setQna_Img4(filename4);
			}			
		} catch (IOException e) {
			log.info("글쓰기 파일 업로드 실패 : {}",e.getMessage());
		}
		
		
		int n = noteService.insertNote(qna);
		
		String msg = (n>0)?"등록완료":"등록실패";
		String loc = (n>0)?"qnaList.do" : "javascript:history.back()";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "include/message";
	}
	
	@RequestMapping("/qnaList.do")
	public String qnaList(Model model,
			@ModelAttribute("paging") PagingVO paging,
			HttpServletRequest request,	HttpSession session){
		
		String userid = (String) session.getAttribute("userid");
		paging.setUserid(userid);
		
		int totalCount = noteService.getTotalCount(paging);
		paging.setTotalCount(totalCount);
		
		int pageSize = 10;
		paging.setPageSize(pageSize);
		paging.init();
		
		//1:1문의이니까 해당 회원의 글만 볼수 있게 페이징에 userid 셋
		String myctx = request.getContextPath();
		String loc = "qnaList.do";
		String pageNavi = paging.getPageNavi(myctx, loc);
		
		List<NoteVO> clist = noteService.ListAllNote(paging);
		
		model.addAttribute("clist", clist);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNavi", pageNavi);
		
		return "complain/qnaList";
	}
	
	@RequestMapping("/qnaListEnd.do")
	public String qnaListEnd(Model model,
			@RequestParam(defaultValue="0") int qna_idx){
		String msg = "";
		if(qna_idx == 0){
			msg = "잘못된 경로";
			model.addAttribute("msg", msg);
			
			return "include/message";
		}
		NoteVO nvo = noteService.getListByIdx(qna_idx);
		model.addAttribute("note", nvo);
		
		return "complain/qnaListEnd";
	}
	
	@RequestMapping("/qnaDel.do")
	public String otootoquiryDel(Model model,
			@RequestParam("checkTr")String[] str){
		
		int n = 0;
		String msg = null;
		if(str != null){
			for(int i = 0; i<str.length; i++){
				n = noteService.deleteBoard(Integer.parseInt(str[i]));
			}
			msg = (n>0)?"삭제완료":"삭제실패";
		}
		String loc=(n>0)?"qnaList.do"/*?userid="+userid*/:"javascript:history.back()";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "include/message";
	}
}






















