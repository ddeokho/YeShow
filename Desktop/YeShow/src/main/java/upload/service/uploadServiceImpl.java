package upload.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import upload.model.OwnerCheckVO;
import upload.model.flagVO;
import upload.model.reservation2VO;
import upload.model.reservationVO;
import upload.model.resfileVO;
import upload.model.resviewVO;
import upload.model.tableup2VO;
import upload.model.tableupVO;
import upload.model.uploadDAO;
import upload.model.uploadVO;
import ye.model.MemberVO;

@Service
public class uploadServiceImpl implements uploadService {

	@Autowired
	private uploadDAO uploadDAO;
	
	
	public int insertRes(uploadVO upload) {
		return uploadDAO.insertRes(upload);
	}

	/*public List<uploadVO> selectAllRes() {
		
		return uploadDAO.selectAllRes();
	}*/

	public List<uploadVO> selectAllRes(Map<String,Integer> map) {
		
		return uploadDAO.selectAllRes(map);
	}

	public int getTotalCount() {
		
		return uploadDAO.getTotalCount();
	}
//////////////////////////////////////////////////////////////////////
	
	public int deleteRes(Integer upnum) {
		
		int n1=uploadDAO.deleteRes(upnum);
		
/*		int n4=0;
		
		if(n1>0){
			
			int n2=uploadDAO.deleteResImg(upnum);
			
			if(n2>0){
				
				int	n3=uploadDAO.deleteResReview(upnum);
				
				if(n3>0){
					n4=uploadDAO.deleteRes(upnum);
				}
				
			}
			
		}*/	
		
		return n1; 
		
	}
/////////////////////////////////////////////////////////////////////
	public int updateRes(Integer upnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	public uploadVO detailRes(Integer upnum) {
		
		return uploadDAO.detailRes(upnum);
	}

	public int insertResfile(String upiname) {
		
		return 0;
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public int insertRes(uploadVO upload, ArrayList<resfileVO> fvo) {
		//내용 등록
		int n1=uploadDAO.insertRes(upload);
		
		int n2=0;
		//이미지 등록
		if(n1>0){
			for(resfileVO f:fvo){
				 n2=uploadDAO.insertResImg(f.getUpiname());
			}
		}
		
		return n2;
	}

	public List<resviewVO> selectStar() {
		
		return uploadDAO.selectStar();
	}

	public List<resfileVO> detailImg(int upnum) {
	
		return uploadDAO.detailImg(upnum);
	}

	public int deleteImg(int di) {
	
		return uploadDAO.deleteImg(di);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public int updateRes(uploadVO upload, ArrayList<resfileVO> fvo) {
		//내용 등록
		int n1=uploadDAO.updateRes(upload);
		
		int n2=0;
		//이미지 등록
		if(fvo!=null){
			for(resfileVO f:fvo){
				 n2=uploadDAO.insertResImg2(f);
			}
		}
		
		return n1;
	}

	public List<tableupVO> viewResTable(int upnum) {
		
		return uploadDAO.viewResTable(upnum);
	}


	public int insertReservation(reservationVO reservation) {
		
		return uploadDAO.insertReservation(reservation);
	}

	public List<reservationVO> viewReserv(int upnum) {
		
		return uploadDAO.viewReserv(upnum);
	}

	public List<tableup2VO> viewResTable2(int upnum) {
		
		return uploadDAO.viewResTable2(upnum);
	}

	public List<reservation2VO> selectResvervation(int idx) {
		
		return uploadDAO.selectResvervation(idx);
	}

	public int delResve(int num) {
	
		return uploadDAO.delResve(num);
	}

	public List<OwnerCheckVO> selectOwnerCheck(int idx) {
		
		return uploadDAO.selectOwnerCheck(idx);
	}

	public int deloResve(int num) {
		
		return uploadDAO.deloResve(num);
	}

	
	@Transactional(propagation=Propagation.REQUIRED)
	public int uppenalty(Map<String, Integer> map, flagVO flag) {
		
	//flag 테이블에 1 등록하기=> 등록하면더이상 체크 못함
	int n1=uploadDAO.insertNoshow(flag);
				
	int n2=0;
		//패널티 주기
		if(n1>0){
				
			 n2=uploadDAO.uppenalty(map);
				
		}
			
		return n2;
	}
	
	
	

	public List<MemberVO> selectMember(int idx) {
		
		return uploadDAO.selectMember(idx);
	}

	public List<flagVO> selectflag(int idx) {
		return uploadDAO.selectflag(idx);
	}


	public List<uploadVO> selectSerchRes(Map<String, Object> map) {
		
		return uploadDAO.selectSerchRes(map);
	}


	

	

	

	
	

	
}
