package oboard.service;

import java.util.List;
import java.util.Map;

import oboard.model.OBoardVO;
import oboard.model.OPagingVO;
import oboard.model.OReplyVO;

public interface OBoardService {
	
	int insertBoard(OBoardVO board);//게시글 등록
	
	List<OBoardVO> selectBoardAll(Map<String,Integer> map);//게시 목록 가져오기
	List<OBoardVO> selectBoardAll(OPagingVO paging);//게시 목록 가져오기
	
	//검색 목록 가져오기
	//List<BoardVO> findBoard(PagingVO paging);		
	
	int getTotalCount();//총 게시글 수
	int getTotalCount(OPagingVO paging);//검색한 게시글 수
	
	boolean updateReadnum(Integer idx);//조회수 증가[글 내용 보기 관련]
	
	OBoardVO selectBoardByIdx(Integer idx);//글 내용 보기
	
	//글 삭제나 수정시 해당 글의 비밀번호 가져오기
	String selectPwd(Integer idx);//[글 삭제, 수정 관련]
	
	int deleteBoard(Integer idx);//게시글 삭제
	
	int updateBoard(OBoardVO board);//글 수정
	
	int insertReply(OReplyVO reply);//꼬리글 등록
	
	List<OReplyVO> selectReplyAll(Integer idx);
	//특정 게시글에 대한 꼬리글 목록 가져오기
	
	//특정 게시글의 꼬리글 갯수 가져오기
	int selectReplyCount(Integer idx);
	
	int deleteReply(Integer num);
	//꼬리글 번호로 꼬리글 삭제하기
	
	//계층형 게시판에서 답변글 달기
	int rewriteBoard(OBoardVO board);
}



