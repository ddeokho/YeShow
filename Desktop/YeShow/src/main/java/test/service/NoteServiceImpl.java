package test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.model.NoteDAO;
import test.model.NoteVO;
import test.model.PagingVO;

@Service
public class NoteServiceImpl implements NoteService {
	
	@Autowired
	private NoteDAO noteDao;

	public int insertNote(NoteVO vo) {
		return noteDao.insertNote(vo);
	}

	public List<NoteVO> ListAllNote(PagingVO paging) {
		return noteDao.ListAllNote(paging);
	}

	public int getTotalCount(PagingVO paging) {
		return noteDao.getTotalCount(paging);
	}

	public int deleteBoard(Integer idx) {
		return noteDao.deleteBoard(idx);
	}

	public NoteVO getListByIdx(int qna_idx) {
		return noteDao.getListByIdx(qna_idx);
	}

	public int getNoComment() {
		return noteDao.getNoComment();
	}

}
