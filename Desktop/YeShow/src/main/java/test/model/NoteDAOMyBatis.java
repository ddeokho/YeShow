package test.model;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import javax.annotation.*;

@Repository(value="noteDAOMyBatis")
public class NoteDAOMyBatis extends SqlSessionDaoSupport implements NoteDAO {

	private final String NS = "note.model.NoteMapper";
	private static final Logger log = LoggerFactory.getLogger(NoteDAOMyBatis.class);
	
	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public int insertNote(NoteVO vo) {
		return getSqlSession().insert(NS+".insertNote", vo);
	}

	public List<NoteVO> ListAllNote(PagingVO paging) {
		return getSqlSession().selectList(NS+".ListAllNote", paging);
	}

	public int getTotalCount(PagingVO paging) {
		return getSqlSession().selectOne(NS+".getTotalCount", paging);
	}

	public int deleteBoard(Integer idx) {
		return getSqlSession().delete(NS+".deleteBoard",idx);
	}

	public NoteVO getListByIdx(int qna_idx) {
		return getSqlSession().selectOne(NS+".getListByIdx", qna_idx);
	}

	public int getNoComment() {
		return getSqlSession().selectOne(NS+".getnocomment");
	}

}
