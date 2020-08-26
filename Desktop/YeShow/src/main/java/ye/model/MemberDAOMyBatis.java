package ye.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import test.model.PagingVO;

@Repository("memberDAOMyBatis")
public class MemberDAOMyBatis extends SqlSessionDaoSupport implements MemberDAO {

	private final String NS = "ye.model.MemberMapper";
	private SqlSession ses;
	
	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public MemberVO findMemberByUserid(String userid) throws NotMemberException {
		ses=getSqlSession();
		MemberVO user=ses.selectOne(NS+".findMemberByUserid",userid);
		return user;
	}
	
	public MemberVO isLoginOK(String userid, String pwd) throws NotMemberException {
		MemberVO user=this.findMemberByUserid(userid);
		if(user==null){
			throw new NotMemberException(userid
					+"는 존재하지 않습니다.");
		}
		if(!pwd.equals(user.getPwd1())){
			throw new NotMemberException("비밀번호가 틀려요");
		}
		return user;
	}

	public int insertMember(MemberVO user) {
		ses=this.getSqlSession();
		int n=ses.insert(NS+".insertMember",user);
		return n;
	}

	public int idCheck(String userid) {
		Integer n = this.getSqlSession().selectOne(NS+".idCheck",userid);
		if(n == null){
			return 1;
		}else{
			return 0;
		}
	}

	public int deleteMember(Integer idx) {
		ses=this.getSqlSession();
		int n=ses.delete(NS+".deleteMember",idx);
		return n;
	}

	public MemberVO findMemberByIdx(Integer idx) {
		ses=this.getSqlSession();
		MemberVO vo=ses.selectOne(NS+".findMember",idx);
		return vo;
	}
	
	public int updateMember(MemberVO user) {
		ses=this.getSqlSession();
		int n=ses.update(NS+".updateMember",user);
		return n;
	}

	public String finduserid(String name, String email) {
		ses=this.getSqlSession();
		Map<String, String> map=new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		String member=ses.selectOne(NS+".finduserid",map);
		return member;
	}

	public String findpwd(String userid1, String email) {
		ses=this.getSqlSession();
		Map<String, String> map=new HashMap<String, String>();
		map.put("userid1", userid1);
		map.put("email", email);
		String member=ses.selectOne(NS+".findpwd",map);
		return member;
	}

	public int getTotalCount(PagingVO paging) {
		return getSqlSession().selectOne(NS+".getTotalCount", paging);
	}

	public List<MemberVO> allmemberList(PagingVO paging) {
		return getSqlSession().selectList(NS+".allmemberList", paging);
	}

	public int insertAdmin(MemberVO user) {
		return getSqlSession().insert(NS+".insertAdmin", user);
	}

	public int getTotalCountA(PagingVO paging) {
		return getSqlSession().selectOne(NS+".getTotalCountA", paging);
	}

	public List<MemberVO> alladminList(PagingVO paging) {
		return getSqlSession().selectList(NS+".alladminList", paging);
	}

	
	

}
