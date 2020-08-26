package upload.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ye.model.MemberVO;


public interface uploadDAO {
	
	//업로드 등록
	public int insertRes(uploadVO upload);
	

	/*//메인 전부다 보여주기
	public List<uploadVO> selectAllRes();*/
	
	//메인 리스트 보여주기
	public List<uploadVO> selectAllRes(Map<String,Integer> map);
	public int getTotalCount();
	
	
	
	
	//매장등록 폼 지우기
	public int deleteRes(Integer upnum);
	
	/*//매장등록 폼 리뷰 지우기
	public int deleteResReview(Integer upnum);
	
	//매장등록 폼 사진 지우기
	public int deleteResImg(Integer upnum);
	
	//매장등록 폼 메뉴 지우기
	public int deleteResMenu(Integer upnum);*/
	
	
	
	
	//수정폼
	public int updateRes(Integer upnum);
	
	//등록된 매장 들어가기
	public uploadVO detailRes(Integer upnum);

	//이미지 등록하기 대기
	public int insertResImg(String upiname);

	
	//레스토랑별 별점 표시
	public List<resviewVO> selectStar();
	
	//수정할떄 캐러셀 이미지 가져오기
	public List<resfileVO> detailImg(int upnum);
	
	//수정할떄 캐러셀 이미지 지우기
	public int deleteImg(int di);
	
	//업로드 식당 수정 폼
	public int updateRes(uploadVO upload);
	
	//예약폼에서 테이블 보여주기
	public List<tableupVO> viewResTable(int upnum);
	
	//예약폼에서  예약과 join한 테이블 보여주기
	public List<tableup2VO> viewResTable2(int upnum);

	//캐러셀 사진 업데이트하기
	public int insertResImg2(resfileVO f);
	
	//예약하기
	public int insertReservation(reservationVO reservation);
	
	//예약확인하기
	public List<reservationVO> viewReserv(int upnum);
	
	//회원이 예약 확인하기 
	public List<reservation2VO> selectResvervation(int idx);
	
	//예약삭제하기
	public int delResve(int num);
	
	//업주 예약정보 확인
	public List<OwnerCheckVO> selectOwnerCheck(int idx);
	
	//업주 예약 삭제
	public int deloResve(int num);
	
	//패널티 추가
	public int uppenalty(Map<String, Integer> map);
	
	//회원 정보 가져오기
	public List<MemberVO> selectMember(int idx);
	
	//flag 1로 만들어주는 값
	public int insertNoshow(flagVO flag);
	
	//flag 정보 가져오기
	public List<flagVO> selectflag(int idx);
	
	//메인 검색
	public List<uploadVO> selectSerchRes(Map<String, Object> map);
	
}
