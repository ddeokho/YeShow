package ye.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.util.CommonUtil;
import ye.model.MemberVO;
import ye.service.MemberService;

@Controller
public class YeController {

	@Autowired
	private MemberService mber;
	private static final Logger log = LoggerFactory.getLogger(YeController.class);
	
	@Autowired
	CommonUtil util;
	
	@RequestMapping("/join.do")
	public void join(){
		
	}

	/** 회원가입 폼 보여주기-GET방식 */
	@RequestMapping(value = "/member.do", method = RequestMethod.GET)
	public String memberjoin(Model model,@RequestParam("sta")String sta) {
		System.out.println(sta);
		model.addAttribute("sta", sta);
		
		return "member/member";
	}

	/** 회원가입 처리-POST방식 */
	@RequestMapping(value = "/member.do", method = RequestMethod.POST)
	public String memberJoinEnd(Model model, @ModelAttribute("user") MemberVO user) {
		int n = mber.insertMember(user);
		String msg = (n > 0) ? "회원가입 성공" : "가입 실패";
		String loc = (n > 0) ? "./main.do" : "javascript:history.back()";

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "member/message";
	}

	/** 회원가입 관련-아이디 중복 체크 */
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public @ResponseBody int idCheckForm(HttpServletResponse res, @RequestParam(defaultValue = "") String userid) {
		res.setHeader("Cache-Control", "no-cache");
		int n = mber.idCheck(userid.trim());
		return n;
	}

	/** 회원가입 관련-회원 정보 수정 */
	@RequestMapping(value = "/memberEdit.do", method = RequestMethod.POST)
	public String memberEdit(Model model, @RequestParam(defaultValue = "0") int idx) {
		log.debug("memberEdit() idx={}", idx);
		MemberVO user = mber.findMemberByIdx(idx);
		model.addAttribute("user", user);
		return "member/memberEdit";
	}// ----------------------------------------------------------

	@RequestMapping(value = "/memberEditEnd.do", method = RequestMethod.POST)
	public String updateMember(Model model, @ModelAttribute("user") MemberVO user,HttpSession ses) {
		System.out.println(user.toString());
		MemberVO mvo=(MemberVO)ses.getAttribute("loginUser");
		user.setIdx(mvo.getIdx());
		int n = mber.updateMember(user);
		String msg = (n > 0) ? "수정 성공" : "수정 실패";
		String loc = (n > 0) ? "./main.do" : "javascript:history.back()";
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "member/message";
	}// -----------------------------------------------------------------------

	@RequestMapping(value="/memberDel.do")
	public String deleteMember(Model model,@RequestParam(defaultValue="0")int idx,
			HttpSession ses){
		if(idx==0){
			return "redirect:/memberEdit.do";
		}
		int n=mber.deleteMember(idx);
		
		ses.invalidate();
				
		String msg=(n>0)?"탈퇴 성공":"탈퇴 실패";
		String loc = "main.do";
		return util.addMsgLoc(model, msg, loc);
	}//------------------------------------------------------
	
	@RequestMapping(value="/find_id.do")
	public String finduserid(){
		return "member/find_id";
	}
	
	@RequestMapping(value="/member/find_id.do")
	public String finduserid(Model model, @RequestParam("findid_name")String name,
			@RequestParam("findid_email")String email) {		
		String m=mber.finduserid(name, email);
		model.addAttribute("userid1",m);
		return "member/find";
	}

	@RequestMapping(value="/find_pwd.do")
	public String findpwd() {
		return "member/find_pwd";
	}
	
	@RequestMapping(value="/member/find_pwd.do")
	public String findpwd(Model model, @RequestParam("findpwd_id")String userid1,
			@RequestParam("findpwd_email")String email){
		String me=mber.findpwd(userid1,email);
		model.addAttribute("pwd1",me);
		return "member/findpwd";
	}
}
