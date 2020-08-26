package board.service;

import java.util.List;
import java.util.Map;

import board.model.BoardVO;
import board.model.FileVO;
import board.model.PagingVO;

public interface BoardService {

	int insertBoard(BoardVO Board); // 게시글 등록
	List<BoardVO> selectBoardAll(Map<String,Integer> map);//게시 목록 가져오기
	List<BoardVO> selectBoardAll(PagingVO paging);//검색 및 페이징 처리
	int getTotalCount();//총 게시글 수
	int getTotalCount(PagingVO paging);//검색한 게시글 수 

	//view
	int updatemb_recommand(Integer mb_num);//추천하기
	boolean updatemb_hits(Integer mb_num);//조회수 증가[글 내용 보기 관련]
	BoardVO selectBoardBymb_num(Integer mb_num);//글 내용 보기
	int insertfile(FileVO File);//파일 업로드

	
	
	//글 수정 삭제 시 로그인 유저의 로그인 세션 가져오기
	/*String selectPwd(Integer idx);//로그인 유저의 패스워드
*/	
	
	
	int deleteBoard(Integer mb_num);//글 삭제
	int updateBoard(BoardVO board);//글 수정
}
