package upload.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import upload.model.*;
import ye.model.MemberVO;

public interface uploadService {

	/**업주 업로드관련*/
	//업로드 등록
	public int insertRes(uploadVO upload);
	
	/*//메인 전부다 보여주기
	public List<uploadVO> selectAllRes();*/
	
	//메인 리스트 보여주기
	public List<uploadVO> selectAllRes(Map<String, Integer>map);
	
	public int getTotalCount();
	
	
	
	
	//매장등록 폼 지우기
	public int deleteRes(Integer upnum);
	
	
	
	//수정폼
	public int updateRes(Integer upnum);
	
	//레스토랑 상세정보
	uploadVO detailRes(Integer upnum);

	
	//이미지--대기
	public int insertResfile(String upiname);
	
	//내용 및 이미지파일 업로르
	public int insertRes(uploadVO upload, ArrayList<resfileVO> fvo);

	//레스토랑별 별점 표시
	public List<resviewVO> selectStar();
	
	//수정할떄 캐러셀 이미지 가져오기
	public List<resfileVO> detailImg(int upnum);
	
	//수정할떄 캐러셀 이미지 지우기
	public int deleteImg(int di);
	
	//업로드 식당 수정 폼
	public int updateRes(uploadVO upload, ArrayList<resfileVO> fvo);
	
	//예약폼에서 테이블 보여주기
	public List<tableupVO> viewResTable(int upnum);

	//예약폼에서  예약과 join한 테이블 보여주기
	public List<tableup2VO> viewResTable2(int upnum);
	
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
	public int uppenalty(Map<String, Integer> map, flagVO flag);
	
	//회원 정보 가져오기
	public List<MemberVO> selectMember(int idx);
	
	//flag 정보 가져오기
	public List<flagVO> selectflag(int idx);
	
	//메인 검색
	public List<uploadVO> selectSerchRes(Map<String, Object> map);

	
	
	
	

	
	
}
