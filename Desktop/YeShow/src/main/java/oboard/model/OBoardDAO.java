package oboard.model;

import java.util.List;
import java.util.Map;

public interface OBoardDAO {
	
	int insertBoard(OBoardVO board);
	
	List<OBoardVO> selectBoardAll(Map<String,Integer> map);	
	List<OBoardVO> selectBoardAll(OPagingVO paging);

	//검색 목록 가져오기
	List<OBoardVO> findBoard(OPagingVO paging);		
		
	int getTotalCount();//총 게시글 수
	int getTotalCount(OPagingVO paging);//총 게시글 수(검색 포함)
	
	boolean updateReadnum(Integer idx);
	OBoardVO selectBoardByIdx(Integer idx);
	
	
	String selectPwd(Integer idx);
	
	int deleteBoard(Integer idx);
	
	int updateBoard(OBoardVO board);
	
	int insertReply(OReplyVO reply);//꼬리글 등록	
	List<OReplyVO> selectReplyAll(Integer idx);
	
	int selectReplyCount(Integer idx);
	
	//특정 게시글에 대한 꼬리글 목록 가져오기	
	int deleteReply(Integer num);//꼬리글 번호로 꼬리글 삭제하기
	
	//계층형 게시판에서 답변글 달기
	int rewriteBoard(OBoardVO board);
	
	OBoardVO selectRefLevSunbun(int idx);
	
	int updateSunbun(OBoardVO parent);
	
	
}




