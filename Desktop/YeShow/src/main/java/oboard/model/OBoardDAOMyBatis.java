package oboard.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository(value="OBoardDAOMyBatis")
public class OBoardDAOMyBatis extends SqlSessionDaoSupport
implements OBoardDAO {
	private final String NS="oboard.model.OBoardMapper";
	
	private static final Logger log
	=LoggerFactory.getLogger(OBoardDAOMyBatis.class);
	
	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public int insertBoard(OBoardVO board) {
	return this.getSqlSession().insert(
							NS+".insertBoard", board);
	}

	public List<OBoardVO> selectBoardAll(
			Map<String, Integer> map) {
		return this.getSqlSession()
					.selectList(NS+".listBoard", map);
	}
	public List<OBoardVO> selectBoardAll(OPagingVO paging) {
		return this.getSqlSession()
			.selectList(NS+".listBoardPaging",paging);
	}

	public List<OBoardVO> findBoard(OPagingVO paging) {
		// TODO Auto-generated method stub
		return null;
	}
	public int getTotalCount() {		
		return this.getSqlSession()
				.selectOne(NS+".totalCount",null);
	}

	public int getTotalCount(OPagingVO paging) {
		return this.getSqlSession()
				.selectOne(NS+".totalCount",paging);
				
	}

	public boolean updateReadnum(Integer idx) {
		int n=this.getSqlSession()
				.update(NS+".updateReadnum",idx);
		return (n>0)? true: false;
	}

	public OBoardVO selectBoardByIdx(Integer idx) {
		return this.getSqlSession()
				.selectOne(NS+".selectBoardByIdx",idx);
	}

	public String selectPwd(Integer idx) {		
		return this.getSqlSession()
				.selectOne(NS+".selectPwd", idx);
	}

	public int deleteBoard(Integer idx) {
		return this.getSqlSession()
				.delete(NS+".deleteBoard", idx);
	}

	public int updateBoard(OBoardVO board) {
		return this.getSqlSession()
				.update(NS+".updateBoard", board);
	}

	public int insertReply(OReplyVO reply) {
		return this.getSqlSession()
				.insert(NS+".insertReply",reply);
	}

	public List<OReplyVO> selectReplyAll(Integer idx) {
		return this.getSqlSession()
				.selectList(NS+".listReply",idx);
	}

	public int selectReplyCount(Integer idx) {
		return this.getSqlSession()
				.selectOne(NS+".countReply",idx);
	}

	public int deleteReply(Integer num) {
		// TODO Auto-generated method stub
		return 0;
	}
	public OBoardVO selectRefLevSunbun(int idx){
		
		return this.getSqlSession()
		.selectOne(NS+".selectRefLevSunbun",idx);
	}
	
	public int updateSunbun(OBoardVO parent){
		return this.getSqlSession()
				.update(NS+".updateSunbun",parent);
	}

	public int rewriteBoard(OBoardVO board) {
		//[1] 원글의 글번호(idx)로 원글의 refer,lev, sunbun
		//     을 가져온다.(select)
		OBoardVO parent
		=this.selectRefLevSunbun(board.getIdx());
		log.debug("원글 : refer={}", parent.getRefer());
		log.debug("원글 : lev={}", parent.getLev());
		log.debug("원글 : sunbun={}", parent.getSunbun());
		
		//[2] 원글에 달린 기존의 답변글들이 있다면
		//    그 글의 순번을 1씩 증가시킨다.(update)
		
		int n=this.updateSunbun(parent);
		
		//[3] 내가 쓴 답변 글을 insert한다. (insert)
		//   이 때 원글의 글 그룹번호(refer)와 내가 쓴 글의
		//   refer 값을 동일하게 주고 lev과 sunbun은
		//   원글 보다 1씩 증가시켜준다.
		board.setRefer(parent.getRefer());
		//같은 글그룹 번호로 설정
		board.setLev(parent.getLev()+1);
		board.setSunbun(parent.getSunbun()+1);
		
		return this.getSqlSession()
				.insert(NS+".insertRewrite", board);
	}

	

}
