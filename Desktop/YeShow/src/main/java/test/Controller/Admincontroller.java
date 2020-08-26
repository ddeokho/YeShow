package test.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.model.NoteVO;
import test.model.NoticeVO;
import test.model.PagingVO;
import test.model.ReNoteVO;
import test.service.NoteService;
import test.service.ReNoteService;
import ye.model.MemberVO;
import ye.service.MemberService;

@Controller
@RequestMapping("/admin")
public class Admincontroller {
	@Autowired
	private NoteService noteService;
	
	@Autowired
	private ReNoteService renoteService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/qnaList.do")
	public String qnaList(Model model,
			@ModelAttribute("paging") PagingVO paging,
			HttpServletRequest request){
		int noComment = noteService.getNoComment();
		
		int totalCount = noteService.getTotalCount(paging);
		paging.setTotalCount(totalCount);
		int pageSize = 10;
		paging.setPageSize(pageSize);
		paging.init();
		//1:1문의이니까 해당 회원의 글만 볼수 있게 페이징에 userid 셋
		String myctx = request.getContextPath();
		String loc = "admin/qnaList.do";
		String pageNavi = paging.getPageNavi(myctx, loc);
		
		List<NoteVO> list = noteService.ListAllNote(paging);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNavi", pageNavi);
		model.addAttribute("noComment", noComment);
		
		return "admin/complainList";
	}
	
	@RequestMapping("/complainListEnd.do")
	public String qnaEnd(Model model,
			@RequestParam(defaultValue="0") int idx){
		
		NoteVO ovo = noteService.getListByIdx(idx);
		ReNoteVO ocvo = renoteService.selectReplyByIdx(idx);
		System.out.println(ocvo);
		model.addAttribute("ovo", ovo);
		model.addAttribute("ocvo", ocvo);
		
		return "admin/complainListEnd";
	}
	
	@RequestMapping("/reply.do")
	public String reply(Model model,
			@ModelAttribute("rvo")ReNoteVO rvo){
		
		int n = renoteService.insertReply(rvo);
		
		String msg=(n>0)?"글쓰기 성공":"글 쓰기 실패";
		String loc=(n>0)?"qnaList.do":"javascript:history.back()";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "include/message";
	}
	
	@RequestMapping("/noticeWrite.do")
	public String noticeWrite(){
		return "admin/noticeWrite";
	}
	
	@RequestMapping("/noticeWriteEnd.do")
	public String noticeWriteEnd(Model model,
			@ModelAttribute("notice") NoticeVO notice){
		String msg = "";
		String loc = "";
		return "include/message";
	}
	
	@RequestMapping("/memberList.do")
	public String memberList(Model model,
			@ModelAttribute("paging") PagingVO paging,
			HttpServletRequest request){
		
		int totalCount = memberService.getTotalCount(paging);
		paging.setTotalCount(totalCount);
		int pageSize = 10;
		paging.setPageSize(pageSize);
		paging.init();
		
		String myctx = request.getContextPath();
		String loc = "memberList.do";
		String pageNavi = paging.getPageNavi(myctx, loc);
		
		List<MemberVO> mlist = memberService.allmemberList(paging);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("mList", mlist);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNavi", pageNavi);
		
		return "admin/memberList";
	}
	
	/*@RequestMapping("/adminJoin.do")
	public String adminJoin(){
		return "admin/admin_joinForm";
	}*/
	
	@RequestMapping("/admin_joinEnd.do")
	public String adminJoinEnd(Model model,
			@ModelAttribute("user") MemberVO user){
		int n = memberService.insertAdmin(user);
		
		String msg=(n>0)?"성공":"실패";
		String loc=(n>0)?"index.do":"javascript:history.back()";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "include/message";
	}
	
	@RequestMapping("/adminList.do")
	public String adminList(Model model,
			@ModelAttribute("paging") PagingVO paging,
			HttpServletRequest request){
		
		int totalCount = memberService.getTotalCountA(paging);
		paging.setTotalCount(totalCount);
		int pageSize = 10;
		paging.setPageSize(pageSize);
		paging.init();
		
		String myctx = request.getContextPath();
		String loc = "adminList.do";
		String pageNavi = paging.getPageNavi(myctx, loc);
		
		List<MemberVO> alist = memberService.alladminList(paging);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("alist", alist);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNavi", pageNavi);
		
		
		return "admin/adminList";
	}
}



















