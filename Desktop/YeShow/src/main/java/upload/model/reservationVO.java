package upload.model;

public class reservationVO {
	
	private Integer num;//예약번호--
	private Integer idx;//회원번호--
	private String re_resuser;//예약자 이름--
	private String re_restime;//예약시간
	private String re_resname;//식당이름--
	private Integer upnum;//얼보드 번호--
	private Integer tablenum;//테이블 번호--
	private String resdate;//예약날짜--

	
	
	
	public reservationVO(Integer num, Integer idx, String re_resuser, String re_restime, String re_resname,
			Integer upnum, Integer tablenum, String resdate) {
		super();
		this.num = num;
		this.idx = idx;
		this.re_resuser = re_resuser;
		this.re_restime = re_restime;
		this.re_resname = re_resname;
		this.upnum = upnum;
		this.tablenum = tablenum;
		this.resdate = resdate;
	}



	public String getResdate() {
		return resdate;
	}



	public void setResdate(String resdate) {
		this.resdate = resdate;
	}



	@Override
	public String toString() {
		return "reservationVO [num=" + num + ", idx=" + idx + ", re_resuser=" + re_resuser + ", re_restime="
				+ re_restime + ", re_resname=" + re_resname + ", upnum=" + upnum + ", tablenum=" + tablenum
				+ ", resdate=" + resdate + "]";
	}



	public Integer getNum() {
		return num;
	}



	public void setNum(Integer num) {
		this.num = num;
	}



	public Integer getIdx() {
		return idx;
	}



	public void setIdx(Integer idx) {
		this.idx = idx;
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



	public String getRe_resname() {
		return re_resname;
	}



	public void setRe_resname(String re_resname) {
		this.re_resname = re_resname;
	}



	public Integer getUpnum() {
		return upnum;
	}



	public void setUpnum(Integer upnum) {
		this.upnum = upnum;
	}



	public Integer getTablenum() {
		return tablenum;
	}



	public void setTablenum(Integer tablenum) {
		this.tablenum = tablenum;
	}



	public reservationVO() {
		// TODO Auto-generated constructor stub
	}

}
