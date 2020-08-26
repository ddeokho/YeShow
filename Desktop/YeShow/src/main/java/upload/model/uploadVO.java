package upload.model;

import java.io.Serializable;
import java.sql.Date;

public class uploadVO implements Serializable {

	private Integer upnum;//프라이머리키-
	private String upwriter;//작성자-
	private String uprestaurant;//가게이름-
	private String upphon;//번호-
	private String uptitle;//간략소개-
	private String upmsg;//상세소개-
	private String uptable;//테이블-
	private Date upindate;//날짜-
	private String uplocation;//위치
	private String fonum;//대표메뉴-
	private String connum;//음식나라-
	private Integer idx;//회원참초키-
	private String upbusiness;//영업시간--
	private String uprest;//휴무일--
	private String upstate;//업로드 상태--
	private Integer upaccept;//최대수용인원--
	

	
	
	public uploadVO(Integer upnum, String upwriter, String uprestaurant, String upphon, String uptitle, String upmsg,
			String uptable, Date upindate, String uplocation, String fonum, String connum, Integer idx,
			String upbusiness, String uprest, String upstate, Integer upaccept, String upiname) {
		super();
		this.upnum = upnum;
		this.upwriter = upwriter;
		this.uprestaurant = uprestaurant;
		this.upphon = upphon;
		this.uptitle = uptitle;
		this.upmsg = upmsg;
		this.uptable = uptable;
		this.upindate = upindate;
		this.uplocation = uplocation;
		this.fonum = fonum;
		this.connum = connum;
		this.idx = idx;
		this.upbusiness = upbusiness;
		this.uprest = uprest;
		this.upstate = upstate;
		this.upaccept = upaccept;
		this.upiname = upiname;
	}

	public Integer getUpaccept() {
		return upaccept;
	}

	public void setUpaccept(Integer upaccept) {
		this.upaccept = upaccept;
	}

	public uploadVO(Integer upnum, String upwriter, String uprestaurant, String upphon, String uptitle, String upmsg,
			String uptable, Date upindate, String uplocation, String fonum, String connum, Integer idx,
			String upbusiness, String uprest, String upstate, String upiname) {
		super();
		this.upnum = upnum;
		this.upwriter = upwriter;
		this.uprestaurant = uprestaurant;
		this.upphon = upphon;
		this.uptitle = uptitle;
		this.upmsg = upmsg;
		this.uptable = uptable;
		this.upindate = upindate;
		this.uplocation = uplocation;
		this.fonum = fonum;
		this.connum = connum;
		this.idx = idx;
		this.upbusiness = upbusiness;
		this.uprest = uprest;
		this.upstate = upstate;
		this.upiname = upiname;
	}

	public String getUpstate() {
		return upstate;
	}

	public void setUpstate(String upstate) {
		this.upstate = upstate;
	}

	public String getUpbusiness() {
		return upbusiness;
	}

	public void setUpbusiness(String upbusiness) {
		this.upbusiness = upbusiness;
	}

	public String getUprest() {
		return uprest;
	}

	public void setUprest(String uprest) {
		this.uprest = uprest;
	}
	
	
	/////////이미지 보여주기
	private String upiname;
	
	
	public uploadVO(String upiname) {
		super();
		this.upiname = upiname;
	}

	public uploadVO(Integer upnum, String upwriter, String uprestaurant, String upphon, String uptitle, String upmsg,
			String uptable, Date upindate, String uplocation, String fonum, String connum, Integer idx,
			String upiname) {
		super();
		this.upnum = upnum;
		this.upwriter = upwriter;
		this.uprestaurant = uprestaurant;
		this.upphon = upphon;
		this.uptitle = uptitle;
		this.upmsg = upmsg;
		this.uptable = uptable;
		this.upindate = upindate;
		this.uplocation = uplocation;
		this.fonum = fonum;
		this.connum = connum;
		this.idx = idx;
		this.upiname = upiname;
	}
	
	public String getUpiname() {
		return upiname;
	}
	public void setUpiname(String upiname) {
		this.upiname = upiname;
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
	public String getUptitle() {
		return uptitle;
	}
	public void setUptitle(String uptitle) {
		this.uptitle = uptitle;
	}
	public String getUpmsg() {
		return upmsg;
	}
	public void setUpmsg(String upmsg) {
		this.upmsg = upmsg;
	}
	public String getUptable() {
		return uptable;
	}
	public void setUptable(String uptable) {
		this.uptable = uptable;
	}
	public Date getUpindate() {
		return upindate;
	}
	public void setUpindate(Date upindate) {
		this.upindate = upindate;
	}
	public String getUplocation() {
		return uplocation;
	}
	public void setUplocation(String uplocation) {
		this.uplocation = uplocation;
	}
	public String getFonum() {
		return fonum;
	}
	public void setFonum(String fonum) {
		this.fonum = fonum;
	}
	public String getConnum() {
		return connum;
	}
	public void setConnum(String connum) {
		this.connum = connum;
	}
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}

	
	public uploadVO() {
		
	}
	public uploadVO(Integer upnum, String upwriter, String uprestaurant, String upphon, String uptitle, String upmsg,
			String uptable, Date upindate, String uplocation, String fonum, String connum, Integer idx) {
		super();
		this.upnum = upnum;
		this.upwriter = upwriter;
		this.uprestaurant = uprestaurant;
		this.upphon = upphon;
		this.uptitle = uptitle;
		this.upmsg = upmsg;
		this.uptable = uptable;
		this.upindate = upindate;
		this.uplocation = uplocation;
		this.fonum = fonum;
		this.connum = connum;
		this.idx = idx;
	}
	@Override
	public String toString() {
		return "uploadVO [upnum=" + upnum + ", upwriter=" + upwriter + ", uprestaurant=" + uprestaurant + ", upphon="
				+ upphon + ", uptitle=" + uptitle + ", upmsg=" + upmsg + ", uptable=" + uptable + ", upindate="
				+ upindate + ", uplocation=" + uplocation + ", fonum=" + fonum + ", connum=" + connum + ", idx=" + idx
				+ ", upbusiness=" + upbusiness + ", uprest=" + uprest + ", upstate=" + upstate + ", upaccept="
				+ upaccept + ", upiname=" + upiname + "]";
	}

	
	
	
	
	

}
