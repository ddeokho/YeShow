package ye.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.model.PagingVO;
import ye.model.MemberDAO;
import ye.model.MemberVO;
import ye.model.NotMemberException;

import java.util.List;

import javax.annotation.*;

@Service
public class MemberServiceImpl implements MemberService {

	@Resource(name="memberDAOMyBatis")
	private MemberDAO memberDao;

	public MemberVO findMemberByUserid(String userid) throws NotMemberException {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertMember(MemberVO user) {
		return memberDao.insertMember(user);
	}

	public int idCheck(String userid) {
		return memberDao.idCheck(userid);
	}

	public MemberVO isLoginOK(String userid, String pwd) throws NotMemberException {
		return memberDao.isLoginOK(userid, pwd);
	}
	
	public MemberVO findMemberByIdx(Integer idx) {
		return memberDao.findMemberByIdx(idx);
	}

	public int deleteMember(Integer idx) {
		return memberDao.deleteMember(idx);
	}

	public int updateMember(MemberVO user) {
		return memberDao.updateMember(user);
	}

	public String finduserid(String name, String email) {	
		return memberDao.finduserid(name,email);
	}

	public String findpwd(String userid1, String email) {
		return memberDao.findpwd(userid1,email);
	}

	public int getTotalCount(PagingVO paging) {
		return memberDao.getTotalCount(paging);
	}

	public List<MemberVO> allmemberList(PagingVO paging) {
		return memberDao.allmemberList(paging);
	}

	public int insertAdmin(MemberVO user) {
		return memberDao.insertAdmin(user);
	}

	public int getTotalCountA(PagingVO paging) {
		return memberDao.getTotalCountA(paging);
	}

	public List<MemberVO> alladminList(PagingVO paging) {
		return memberDao.alladminList(paging);
	}


}
