package upload.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import javax.annotation.*;


@Repository("uploadmenuDAOMyBatis")
public class uploadmenuDAOMyBatis extends SqlSessionDaoSupport implements uploadmenuDAO {

	private final String NS="upload.model.uploadmenuMapper";
	private SqlSession ses;
	
	
	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	
	//메뉴등록
	public int insertMenu(uploadmenuVO menu) {
		ses=this.getSqlSession();
		return ses.insert(NS+".insertMenu",menu);
	}
	
	//메뉴보여주기
	public List<uploadmenuVO> selectAllMenu(Integer upnum) {
		
		//System.out.println("upnum="+upnum);
		ses=this.getSqlSession();
		return ses.selectList(NS+".selectMenu",upnum);
	}

	public int deleteMenu(Integer menudel) {
		ses=this.getSqlSession();
		return ses.delete(NS+".deleteMenu",menudel);
	}

	public int updateMenu(Integer upnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	//리뷰등록
	public int insertresReview(resReviewVO menu) {
		ses=this.getSqlSession();
		return ses.insert(NS+".insertResReview",menu);
	}

	public List<resReviewVO> selectAllresReview(Integer upnum) {
		ses=this.getSqlSession();
		return ses.selectList(NS+".selectResReview",upnum);
	}

	public int deleteresReview(Integer delnum) {
		ses=this.getSqlSession();
		return ses.delete(NS+".deleteresrivew",delnum);
	}


	public List<uploadVO> selectAllImg(int upnum) {
		ses=this.getSqlSession();
		return ses.selectList(NS+".selectAllImg",upnum);
	}


	public List<leastmenupriceVO> selectmenuprice() {
		ses=this.getSqlSession();
		return ses.selectList(NS+".minprice");
	}


	public int insertTable(tableupVO tableup) {
		ses=this.getSqlSession();
		return ses.insert(NS+".tableup",tableup);
	}



	public List<tableupVO> selectTableQ(int upnum) {
		ses=this.getSqlSession();
		return ses.selectList(NS+".selectTableQ",upnum);
	}


	public int delTable(int upnum) {
		ses=this.getSqlSession();
		return ses.delete(NS+".delTeble",upnum);
	}
	
	

}
