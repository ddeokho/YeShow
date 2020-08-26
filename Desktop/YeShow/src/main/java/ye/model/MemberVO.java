package ye.model;

import java.sql.Date;

public class MemberVO {

	private Integer idx;
	private String name;
	private String userid1;
	private String email;
	private String pwd1;
	private String hp1;
	private String hp2;
	private String hp3;
	private String post;
	private String addr1;
	private String addr2;
	private Date indate;
	private String status;
	private Integer penalty;
	
	public MemberVO() {

	}

	public MemberVO(Integer idx, String name, String userid1, String email, String pwd1, String hp1, String hp2,
			String hp3, String post, String addr1, String addr2, Date indate, String status, Integer penalty) {
		super();
		this.idx = idx;
		this.name = name;
		this.userid1 = userid1;
		this.email = email;
		this.pwd1 = pwd1;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.indate = indate;
		this.status = status;
		this.penalty = penalty;
	}

	public Integer getIdx() {
		return idx;
	}

	public void setIdx(Integer idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserid1() {
		return userid1;
	}

	public void setUserid1(String userid1) {
		this.userid1 = userid1;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd1() {
		return pwd1;
	}

	public void setPwd1(String pwd1) {
		this.pwd1 = pwd1;
	}

	public String getHp1() {
		return hp1;
	}

	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}

	public String getHp2() {
		return hp2;
	}

	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}

	public String getHp3() {
		return hp3;
	}

	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public Date getIndate() {
		return indate;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getPenalty() {
		return penalty;
	}

	public void setPenalty(Integer penalty) {
		this.penalty = penalty;
	}
	
	public String getAllHp(){
		return hp1+"-"+hp2+"-"+hp3;
	}
	public String getAllAddr(){
		return addr1+" "+addr2;
	}

	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", name=" + name + ", userid1=" + userid1 + ", email=" + email + ", pwd1="
				+ pwd1 + ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3 + ", post=" + post + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", indate=" + indate + ", status=" + status + ", penalty=" + penalty + "]";
	}

	
	
}