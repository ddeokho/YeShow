package ye.model;

import java.util.List;

import test.model.PagingVO;

public interface MemberDAO {
	
	/**검색이나 로그인시*/
	public MemberVO findMemberByUserid(String userid)
	throws NotMemberException;
	
	/**회원가입*/
	public int insertMember(MemberVO user);
	public int idCheck(String userid);
	
	/**로그인 처리*/
	public MemberVO isLoginOK(String userid, String pwd)
	throws NotMemberException;
	
	/**회원탈퇴 또는 회원정보 삭제*/
	public int deleteMember(Integer idx);
	
	/**회원정보 수정*/
	public int updateMember(MemberVO user);
	
	/**회원번호로 회원정보 찾아오기*/
	public MemberVO findMemberByIdx(Integer idx);

	/**회원 아이디 찾기*/
	public String finduserid(String name, String email);

	/**회원 비밀번호 찾기*/
	public String findpwd(String userid1, String email);

	public int getTotalCount(PagingVO paging); // 총 일반회원 수

	public List<MemberVO> allmemberList(PagingVO paging); // 일반회원
	
	public int insertAdmin(MemberVO user); //관리자 가입
	
	public int getTotalCountA(PagingVO paging);//관리자 총 수

	public List<MemberVO> alladminList(PagingVO paging);// 관리자

}
