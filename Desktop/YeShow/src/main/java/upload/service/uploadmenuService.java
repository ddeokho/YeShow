package upload.service;

import java.util.List;

import upload.model.*;

public interface uploadmenuService {

	/**메뉴 업로드*/
	//메뉴업로드
	public int insertMenu(uploadmenuVO menu);
	
	
	//메뉴 리스트 보여주기
	public List<uploadmenuVO> selectAllMenu(Integer upnum);
	
	//메뉴 지우기
	public int deleteMenu(Integer menudel);
	
	
	//수정폼
	public int updateMenu(Integer upnum);
	
	
	/**댓글 업로드*/
	//식당리뷰업로드
	public int insertresReview(resReviewVO menu);
		
		
	//식당리뷰 리스트 보여주기
	public List<resReviewVO> selectAllresReview(Integer upnum);
		
	//식당리뷰 지우기
	public int deleteresReview(Integer delnum);

	//식당 사진 보여주기
	public List<uploadVO> selectAllImg(int upnum);

	//메뉴 가격 보여주기
	public List<leastmenupriceVO> selectmenuprice();

	//테이블 등록
	public int insertTable(tableupVO tableup);


	//테이블 카운트 보여주기
	public List<tableupVO> selectTableQ(int upnum);

	//테이블 삭제하기
	public int delTable(int upnum);

	
		
}
