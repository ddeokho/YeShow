package upload.model;


public class OwnerCheckVO {
	
	private Integer upnum;//업장 번호
	private String re_resname;//업장 이름
	private String re_resuser;//예약자
	private String re_restime;//예약시간
	private String resdate;//예약일
	private Integer num;//예약 번호
	private Integer owner;//업주 번호 idx
	private Integer memb;//회원 번호
	private String email;//회원 이메일
	private String hp1;//번호
	private String hp2;
	private String hp3;
	private Integer penalty;//패널티
	
	
	
	
	public OwnerCheckVO(Integer upnum, String re_resname, String re_resuser, String re_restime, String resdate,
			Integer num, Integer owner, Integer memb, String email, String hp1, String hp2, String hp3,
			Integer penalty) {
		super();
		this.upnum = upnum;
		this.re_resname = re_resname;
		this.re_resuser = re_resuser;
		this.re_restime = re_restime;
		this.resdate = resdate;
		this.num = num;
		this.owner = owner;
		this.memb = memb;
		this.email = email;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.penalty = penalty;
	}




	@Override
	public String toString() {
		return "OwnerCheckVO [upnum=" + upnum + ", re_resname=" + re_resname + ", re_resuser=" + re_resuser
				+ ", re_restime=" + re_restime + ", resdate=" + resdate + ", num=" + num + ", owner=" + owner
				+ ", memb=" + memb + ", email=" + email + ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3
				+ ", penalty=" + penalty + "]";
	}




	public Integer getUpnum() {
		return upnum;
	}




	public void setUpnum(Integer upnum) {
		this.upnum = upnum;
	}




	public String getRe_resname() {
		return re_resname;
	}




	public void setRe_resname(String re_resname) {
		this.re_resname = re_resname;
	}




	public String getRe_resuser() {
		return re_resuser;
	}




	public void setRe_resuser(String re_resuser) {
		this.re_resuser = re_resuser;
	}




	public String getRe_restime() {
		return re_restime;
	}




	public void setRe_restime(String re_restime) {
		this.re_restime = re_restime;
	}




	public String getResdate() {
		return resdate;
	}




	public void setResdate(String resdate) {
		this.resdate = resdate;
	}




	public Integer getNum() {
		return num;
	}




	public void setNum(Integer num) {
		this.num = num;
	}




	public Integer getOwner() {
		return owner;
	}




	public void setOwner(Integer owner) {
		this.owner = owner;
	}




	public Integer getMemb() {
		return memb;
	}




	public void setMemb(Integer memb) {
		this.memb = memb;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
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




	public Integer getPenalty() {
		return penalty;
	}




	public void setPenalty(Integer penalty) {
		this.penalty = penalty;
	}




	public OwnerCheckVO() {

	}

	
	
}