package board.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository(value="boardDAOMyBatis")
public class BoardDAOMyBatis extends SqlSessionDaoSupport
implements BoardDAO{
	
	
	private final String NS="board.model.BoardMapper";
	
	private static final Logger log
	=LoggerFactory.getLogger(BoardDAOMyBatis.class);

	
	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	
	public int insertBoard(BoardVO Board) {
		return this.getSqlSession()
				.insert(NS+".insertBoard",Board);
	}

	public List<BoardVO> selectBoardAll(Map<String, Integer> map) {
		return this.getSqlSession()
				.selectList(NS+".listBoard",map);
	}

	public int getTotalCount() {
		return this.getSqlSession()
				.selectOne(NS+".totalCount",null);
	}

	public int getTotalCount(PagingVO paging) {
		return this.getSqlSession()
				.selectOne(NS+".totalCount",paging);
	}

	public List<BoardVO> findBoard(PagingVO paging) {
		// TODO Auto-generated method stub
		return null;
	}


	public boolean updatemb_hits(Integer mb_num) {
		int n=this.getSqlSession()
				.update(NS+".updatemb_hits",mb_num);
		return (n>0)? true: false;
	}

	
	

	public BoardVO selectBoardBymb_num(Integer mb_num) {
		return this.getSqlSession()
				.selectOne(NS+".selectBoardBymb_num",mb_num);
	}


	public int insertfile(FileVO File) {
		return this.getSqlSession()
				.insert(NS+".insertfile",File);
	}


	public int deleteBoard(Integer mb_num) {
		return this.getSqlSession().delete(NS+".deleteBoard", mb_num);
	}


	public List<BoardVO> selectBoardAll(PagingVO paging) {
		return this.getSqlSession()
				.selectList(NS+".listBoardPaging", paging);
		
	}


	/*public String selectPwd(Integer idx) {
		return this.getSqlSession().selectOne(NS+".selectPwd",idx);
	}*/


	public int updateBoard(BoardVO board) {
		return this.getSqlSession()
				.update(NS+".updateBoard", board);
	}

public int updatemb_recommand(Integer mb_num) {
		return this.getSqlSession()
				.update(NS+".updatemb_recommand", mb_num);
	}


	

	


	
	
	
	
}
