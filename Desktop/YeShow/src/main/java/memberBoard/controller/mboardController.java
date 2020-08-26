package memberBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;





@Controller
public class mboardController {
	
	//@Autowried 객체를 주입할 때 사용
	//type(w으로 주입함)
	//동일한 자료형의 객체가 여러 개 있을 때는
	//@Qualifier를 이용해 어떤 객체인지 지정한다.
	/*@Autowired*/
	/*private BoardService boardService;*/
/*	
	@Qualifier("mBoardDAOMyBatis")
	private mBoardDAO mboardDao;*/
	
	@RequestMapping("/mBoard.do")
	public String mboard(){
		return "memberBoard/memberBoard";
	}
	
	@RequestMapping("/mBoardup.do")
	public String mboardup()
	{
	
		return "memberBoard/mboardup";
	}
	
}