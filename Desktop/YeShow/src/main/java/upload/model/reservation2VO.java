package upload.model;

public class reservation2VO {
	
	private Integer num;//예약 번호
	private Integer upnum;//얼보드 번호--
	private String upwriter;//작성자
	private String uprestaurant;//식당이름--
	private String upphon;//식당 번호
	private String uplocation;//식당위치--
	private Integer idx;//회원번호--
	private String re_restime;//예약시간
	private String diresmonth;//예약월
	private String diresdate;//예약일
	private String resdate;//예약날짜--
	private Integer tablenum;//테이블 번호--
	
	
	

	

	public reservation2VO(Integer num, Integer upnum, String upwriter, String uprestaurant, String upphon,
			String uplocation, Integer idx, String re_restime, String diresmonth, String diresdate, String resdate,
			Integer tablenum) {
		super();
		this.num = num;
		this.upnum = upnum;
		this.upwriter = upwriter;
		this.uprestaurant = uprestaurant;
		this.upphon = upphon;
		this.uplocation = uplocation;
		this.idx = idx;
		this.re_restime = re_restime;
		this.diresmonth = diresmonth;
		this.diresdate = diresdate;
		this.resdate = resdate;
		this.tablenum = tablenum;
	}




	@Override
	public String toString() {
		return "reservation2VO [num=" + num + ", upnum=" + upnum + ", upwriter=" + upwriter + ", uprestaurant="
				+ uprestaurant + ", upphon=" + upphon + ", uplocation=" + uplocation + ", idx=" + idx + ", re_restime="
				+ re_restime + ", diresmonth=" + diresmonth + ", diresdate=" + diresdate + ", resdate=" + resdate
				+ ", tablenum=" + tablenum + "]";
	}




	public Integer getNum() {
		return num;
	}




	public void setNum(Integer num) {
		this.num = num;
	}


	public Integer getUpnum() {
		return upnum;
	}




	public void setUpnum(Integer upnum) {
		this.upnum = upnum;
	}




	public String getUpwriter() {
		return upwriter;
	}




	public void setUpwriter(String upwriter) {
		this.upwriter = upwriter;
	}




	public String getUprestaurant() {
		return uprestaurant;
	}




	public void setUprestaurant(String uprestaurant) {
		this.uprestaurant = uprestaurant;
	}




	public String getUpphon() {
		return upphon;
	}




	public void setUpphon(String upphon) {
		this.upphon = upphon;
	}




	public String getUplocation() {
		return uplocation;
	}




	public void setUplocation(String uplocation) {
		this.uplocation = uplocation;
	}




	public Integer getIdx() {
		return idx;
	}




	public void setIdx(Integer idx) {
		this.idx = idx;
	}




	public String getRe_restime() {
		return re_restime;
	}




	public void setRe_restime(String re_restime) {
		this.re_restime = re_restime;
	}




	public String getDiresmonth() {
		return diresmonth;
	}




	public void setDiresmonth(String diresmonth) {
		this.diresmonth = diresmonth;
	}




	public String getDiresdate() {
		return diresdate;
	}




	public void setDiresdate(String diresdate) {
		this.diresdate = diresdate;
	}




	public String getResdate() {
		return resdate;
	}




	public void setResdate(String resdate) {
		this.resdate = resdate;
	}




	public Integer getTablenum() {
		return tablenum;
	}




	public void setTablenum(Integer tablenum) {
		this.tablenum = tablenum;
	}




	public reservation2VO() {
		// TODO Auto-generated constructor stub
	}

}
