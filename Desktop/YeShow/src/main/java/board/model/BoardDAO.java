package board.model;

import java.util.List;
import java.util.Map;

public interface BoardDAO {

	
	int insertBoard(BoardVO Board);
	
	//목록 가져오기
	List<BoardVO> selectBoardAll(Map<String,Integer> map);	
	
	List<BoardVO> selectBoardAll(PagingVO paging);//검색 및 페이징 처리


	
	int getTotalCount();//총 게시글 수
	int getTotalCount(PagingVO paging);//총 게시글 수(검색 포함)

	
	int updatemb_recommand(Integer mb_num);//추천하기
	boolean updatemb_hits(Integer mb_num);//조회수 증가
	BoardVO selectBoardBymb_num(Integer mb_num);//글 내용 보기
	
	
	int insertfile(FileVO File);//파일 업로드
	
	//글 수정 삭제 시 로그인 유저의 비밀번호 가져오기
	
	/*String selectPwd(Integer idx);//로그인 유저의 패스워드
*/	
	int deleteBoard(Integer mb_num);//글 삭제
	
	int updateBoard(BoardVO board);//글 수정
	
	
	
}
