package upload.model;

import java.io.Serializable;

public class tableupVO implements Serializable{
	
	private Integer tablenum;
	private Integer tableuser;//인원수
	private String opentime1;//오픈시간1
	private String closetime1;//클로즈시간1
	private String opentime2;//오픈시간2
	private String closetime2;//클로즈시간2
	private Integer upnum;
	private Integer idx;
	


//////////////////////////////////////////////////////////////////
	






	public tableupVO(Integer tablenum, Integer tableuser, String opentime1, String closetime1, String opentime2,
			String closetime2, Integer upnum, Integer idx, Integer restime, String resdate, String restable) {
		super();
		this.tablenum = tablenum;
		this.tableuser = tableuser;
		this.opentime1 = opentime1;
		this.closetime1 = closetime1;
		this.opentime2 = opentime2;
		this.closetime2 = closetime2;
		this.upnum = upnum;
		this.idx = idx;
	}














	public tableupVO(Integer tablenum, Integer tableuser, String opentime1, String closetime1, String opentime2,
			String closetime2, Integer upnum, Integer idx) {
		super();
		this.tablenum = tablenum;
		this.tableuser = tableuser;
		this.opentime1 = opentime1;
		this.closetime1 = closetime1;
		this.opentime2 = opentime2;
		this.closetime2 = closetime2;
		this.upnum = upnum;
		this.idx = idx;
	}





	@Override
	public String toString() {
		return "tableupVO [tablenum=" + tablenum + ", tableuser=" + tableuser + ", opentime1=" + opentime1
				+ ", closetime1=" + closetime1 + ", opentime2=" + opentime2 + ", closetime2=" + closetime2 + ", upnum="
				+ upnum + ", idx=" + idx + "]";
	}










	public Integer getTablenum() {
		return tablenum;
	}










	public void setTablenum(Integer tablenum) {
		this.tablenum = tablenum;
	}










	public Integer getTableuser() {
		return tableuser;
	}










	public void setTableuser(Integer tableuser) {
		this.tableuser = tableuser;
	}










	public String getOpentime1() {
		return opentime1;
	}










	public void setOpentime1(String opentime1) {
		this.opentime1 = opentime1;
	}










	public String getClosetime1() {
		return closetime1;
	}










	public void setClosetime1(String closetime1) {
		this.closetime1 = closetime1;
	}










	public String getOpentime2() {
		return opentime2;
	}










	public void setOpentime2(String opentime2) {
		this.opentime2 = opentime2;
	}










	public String getClosetime2() {
		return closetime2;
	}










	public void setClosetime2(String closetime2) {
		this.closetime2 = closetime2;
	}










	public Integer getUpnum() {
		return upnum;
	}










	public void setUpnum(Integer upnum) {
		this.upnum = upnum;
	}










	public Integer getIdx() {
		return idx;
	}










	public void setIdx(Integer idx) {
		this.idx = idx;
	}





	public tableupVO() {
		// TODO Auto-generated constructor stub
	}

}
