package ye.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ye.service.MemberService;
import common.util.CommonUtil;
import ye.model.MemberVO;
import ye.model.NotMemberException;


@Controller
public class LoginController {
	
	@Autowired
	private MemberService mber;
	
	@Autowired
	private CommonUtil util;
	
	@RequestMapping(value="/loginEnd.do",
			method={RequestMethod.POST,RequestMethod.GET})
	public String loginEnd(Model model,
			HttpSession ses,
			@RequestParam(defaultValue="") String userid,
			@RequestParam(defaultValue="") String pwd) 
					throws NotMemberException{
			//1.유효성 체크
			if(userid.isEmpty()||pwd.isEmpty()){
				return "redirect:/main.do";
			}
			String msg="", loc="";
			//2. 로그인 인증 처리 메소드 호출
			MemberVO loginUser=mber.isLoginOK(userid,pwd);
			if(loginUser!=null){
				//제대로 회원 인증을 받았다면
				//세션에 로그인한 회원 정보를 저장하자.
				ses.setAttribute("loginUser",loginUser);
				msg=loginUser.getUserid1()+"님 환영합니다.";
				loc="./main.do";
			}
			return util.addMsgLoc(model,msg,loc);
	}//-----------------
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession ses){
		ses.invalidate();
		return "redirect:/main.do";
	}//-----------------
	
	
	
	
	
	/*로그인 처리 시 예외가 발생하면 해당 예외 처리를
	 * 위해 @ExceptionHandler어노테이션을 붙여준다.
	 * */
	@ExceptionHandler(NotMemberException.class)
	public String exceptionHandler(Exception ex){
		//error처리 페이지에서는 page지시어에
		//isErrorPage="true"값을 지정하여
		//exception 내장 객체를 사용할 수 있도록 한다.
		
		//예외 처리를 위한 뷰 네임을 반환한다.
		return "login/errorAlert";
	}

}///////////////////////////////////////////








