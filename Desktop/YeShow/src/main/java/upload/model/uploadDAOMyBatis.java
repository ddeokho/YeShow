package upload.model;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import ye.model.MemberVO;

@Repository(value="uploadDAOMyBatis")
public class uploadDAOMyBatis extends SqlSessionDaoSupport implements uploadDAO {

	//매퍼에 정의한 네임 스페이스
		private final String NS="upload.model.uploadResMapper";
		private SqlSession ses;
	
	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	
	public int insertRes(uploadVO upload) {
		
		return this.getSqlSession().insert(NS+".insertRes", upload);
	}

	/*public List<uploadVO> selectAllRes() {
		
		return this.getSqlSession().selectOne(NS+".listResInfo");
	}*/

	public List<uploadVO> selectAllRes(Map<String,Integer> map) {
	
		return this.getSqlSession().selectList(NS+".listResPaging",map);
	}

	public int getTotalCount() {
		ses=this.getSqlSession();
		int tableCnt=ses.selectOne(NS+".resCount");
		return tableCnt;
	}

	
	
	
	
	
	public int deleteRes(Integer upnum) {
		
		ses=this.getSqlSession();
		int delRes=ses.update(NS+".delres",upnum);//지우는 폼이지만 사실 상태를 업데이트
		return delRes;
	}
	
/*	public int deleteResReview(Integer upnum) {
		ses=this.getSqlSession();
		return ses.delete(NS+".delreview",upnum);
	}


	public int deleteResImg(Integer upnum) {
		ses=this.getSqlSession();
		return ses.delete(NS+".delresimg",upnum);
	}


	public int deleteResMenu(Integer upnum) {
		ses=this.getSqlSession();
		return ses.delete(NS+".delresmenu",upnum);
	}
	*/
	
	
	
	

	public int updateRes(Integer upnum) {
		// TODO Auto-generated method stub
		return 0;
	}


	public uploadVO detailRes(Integer upnum) {
		ses=this.getSqlSession();
		
		return ses.selectOne(NS+".detailres",upnum);
	}


/*	public List<uploadVO> selectInfoRes(int upnum) {
	
		ses=this.getSqlSession();
		return ses.selectList(NS+".resinfo",upnum);
	}*/


	public int insertResImg(String upiname) {
		ses=this.getSqlSession();
		return ses.insert(NS+".insertimg",upiname);
	}


	public List<resviewVO> selectStar() {
		
		return this.getSqlSession().selectList(NS+".selectstar");
	}


	public List<resfileVO> detailImg(int upnum) {
		ses=this.getSqlSession();
		return ses.selectList(NS+".imgs",upnum);
	}


	public int deleteImg(int di) {
		ses=this.getSqlSession();
		return ses.delete(NS+".delimg",di);
	}


	public int updateRes(uploadVO upload) {
		ses=this.getSqlSession();
		return ses.update(NS+".updateRes",upload);
	}


	public List<tableupVO> viewResTable(int upnum) {
		ses=this.getSqlSession();
		return ses.selectList(NS+".viewResTable",upnum);
	}


	public int insertResImg2(resfileVO f) {
		
		return this.getSqlSession().insert(NS+".reinsertimg",f);
	}


	public int insertReservation(reservationVO reservation) {
		ses=this.getSqlSession();
		return ses.insert(NS+".insertResvation",reservation);
	}


	public List<reservationVO> viewReserv(int upnum) {
		ses=this.getSqlSession();
		return ses.selectList(NS+".viewReserv",upnum);
	}


	public List<tableup2VO> viewResTable2(int upnum) {
		ses=this.getSqlSession();
		return ses.selectList(NS+".viewResTable2",upnum);
	}


	public List<reservation2VO> selectResvervation(int idx) {
		ses=this.getSqlSession();
		return ses.selectList(NS+".selectResv",idx);
	}


	public int delResve(int num) {
		ses=this.getSqlSession();
		return ses.delete(NS+".delResve",num);
	}


	public List<OwnerCheckVO> selectOwnerCheck(int idx) {
		ses=this.getSqlSession();
		return ses.selectList(NS+".OwnerCheck", idx);
	}


	public int deloResve(int num) {
		ses=this.getSqlSession();
		return ses.delete(NS+".deloResve",num);
	}


	public int uppenalty(Map<String, Integer> map) {
		ses=this.getSqlSession();
		return ses.update(NS+".uppenalty",map);
	}


	public List<MemberVO> selectMember(int idx) {
		ses=this.getSqlSession();
		return ses.selectList(NS+".selectMember",idx);
	}


	public int insertNoshow(flagVO flag) {
		ses=this.getSqlSession();
		return ses.insert(NS+".insertflag",flag);
	}


	public List<flagVO> selectflag(int idx) {
		ses=this.getSqlSession();
		return ses.selectList(NS+".selectflag",idx);
	}


	public List<uploadVO> selectSerchRes(Map<String, Object> map) {
		ses=this.getSqlSession();
		return ses.selectList(NS+".search",map);
	}




	

}
