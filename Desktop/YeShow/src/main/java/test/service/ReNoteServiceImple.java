package test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.model.ReNoteDAO;
import test.model.ReNoteVO;

@Service
public class ReNoteServiceImple implements ReNoteService {

	@Autowired
	private ReNoteDAO renoteDao;
	
	public int insertReply(ReNoteVO rvo) {
		return renoteDao.insertReply(rvo);
	}

	public int selectReplyCount(Integer idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteReply(Integer num) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ReNoteVO selectReplyByIdx(int qna_idx) {
		return renoteDao.selectReplyByIdx(qna_idx);
	}

}
