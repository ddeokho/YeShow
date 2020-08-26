package oboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oboard.model.OBoardDAO;
import oboard.model.OBoardVO;
import oboard.model.OPagingVO;
import oboard.model.OReplyVO;

@Service
public class OBoardServiceImpl implements OBoardService {

	@Autowired
	private OBoardDAO boardDao;
	
	public int insertBoard(OBoardVO board) {
		return boardDao.insertBoard(board);
	}

	public List<OBoardVO> selectBoardAll(
			Map<String, Integer> map) {
		return boardDao.selectBoardAll(map);
	}

	public List<OBoardVO> selectBoardAll(
			OPagingVO paging) {
		return boardDao.selectBoardAll(paging);
	}

	public int getTotalCount() {
		return boardDao.getTotalCount();
	}
	public int getTotalCount(OPagingVO page) {
		return boardDao.getTotalCount(page);
	}

	public boolean updateReadnum(Integer idx) {
		return boardDao.updateReadnum(idx); 
	}

	public OBoardVO selectBoardByIdx(Integer idx) {
		return boardDao.selectBoardByIdx(idx);
	}

	public String selectPwd(Integer idx) {
		return boardDao.selectPwd(idx);
	}

	public int deleteBoard(Integer idx) {
		return boardDao.deleteBoard(idx);
	}

	public int updateBoard(OBoardVO board) {
		return boardDao.updateBoard(board);
	}

	public int insertReply(OReplyVO reply) {
		return boardDao.insertReply(reply);
	}

	public List<OReplyVO> selectReplyAll(Integer idx) {
		return boardDao.selectReplyAll(idx);
	}

	public int selectReplyCount(Integer idx){
		return boardDao.selectReplyCount(idx);
	}

	public int deleteReply(Integer num) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int rewriteBoard(OBoardVO board) {
		return boardDao.rewriteBoard(board);
	}

}






