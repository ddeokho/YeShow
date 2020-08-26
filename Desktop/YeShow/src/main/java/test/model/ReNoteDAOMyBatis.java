package test.model;

import java.util.List;
import javax.annotation.*;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository(value="renoteDAOMyBatis")
public class ReNoteDAOMyBatis extends SqlSessionDaoSupport implements ReNoteDAO {

	private final String NS = "note.model.RenoteMapper";
	private static final Logger log = LoggerFactory.getLogger(ReNoteDAOMyBatis.class);
	
	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public int insertReply(ReNoteVO rvo) {
		NoteVO oto = this.selectCh(rvo.getQnA_idx());
		oto.setCh("1");
		System.out.println(oto);
		int n = this.updateCh(oto);
		return getSqlSession().insert(NS+".insertReply",rvo);
	}

	public int selectReplyCount(Integer idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteReply(Integer num) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ReNoteVO selectReplyByIdx(int qna_idx) {
		return getSqlSession().selectOne(NS+".selectReplyByIdx", qna_idx);
	}

	public int updateCh(NoteVO oto) {
		return getSqlSession().update(NS+".updateinquriych",oto);
	}

	public NoteVO selectCh(int idx_fk) {
		return getSqlSession().selectOne(NS+".selectCh", idx_fk);
	}

}
