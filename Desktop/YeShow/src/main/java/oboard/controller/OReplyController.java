package oboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import common.util.CommonUtil;
import oboard.model.OReplyVO;
import oboard.service.OBoardService;

@Controller
public class OReplyController {
	
	@Autowired
	private OBoardService boardService;
	
	@Autowired
	private CommonUtil util;
	
	private static final Logger log
	=LoggerFactory.getLogger(OReplyController.class);
	
	@RequestMapping("/user/board/reply.do")
	public String replyInsert(Model model,
			@ModelAttribute("reply") OReplyVO rvo){
		int n=boardService.insertReply(rvo);
		String msg=(n>0)?"리플 달기 성공":"리플 달기 실패";
		String loc="../../board/boardview.do?idx="+rvo.getIdx_fk();
		return util.addMsgLoc(model,msg,loc);
	}

}




