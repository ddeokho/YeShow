package test.service;

import java.util.List;

import test.model.ReNoteVO;

public interface ReNoteService {

	int insertReply(ReNoteVO rvo);//꼬리글 등록	
	
	ReNoteVO selectReplyByIdx(int qna_idx);

	int selectReplyCount(Integer idx);
	
	int deleteReply(Integer num);//꼬리글 번호로 꼬리글 삭제하기
}
