package test.service;

import java.util.List;

import test.model.NoteVO;
import test.model.PagingVO;

public interface NoteService {

	public int insertNote(NoteVO vo);

	public List<NoteVO> ListAllNote(PagingVO paging);
	
	int getTotalCount(PagingVO paging);//총 게시글 수(검색 포함)
	
	int deleteBoard(Integer idx);

	public NoteVO getListByIdx(int qna_idx);

	public int getNoComment();
}
