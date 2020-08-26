package test.model;

import java.util.List;


public interface ReNoteDAO {

	int insertReply(ReNoteVO rvo);//꼬리글 등록	
	ReNoteVO selectReplyByIdx(int qna_idx);

	int selectReplyCount(Integer idx);
	int deleteReply(Integer num);//꼬리글 번호로 꼬리글 삭제하기
	public int updateCh(NoteVO oto);
	NoteVO selectCh(int idx_fk);
	
}
