package upload.model;

import java.sql.Date;

public class resReviewVO {
	
	private Integer res_reviewNum;
	private String res_reviewMsg;
	private String res_reviewWriter;
	private Date res_reviewDate;
	private Integer upnum;
	private Integer idx;
	private Integer res_star;
	
	
	//평균 평점 담는 VO
	private Integer staravg;
	

	
	public Integer getStaravg() {
		return staravg;
	}



	public void setStaravg(Integer staravg) {
		this.staravg = staravg;
	}



	public resReviewVO(Integer res_reviewNum, String res_reviewMsg, String res_reviewWriter, Date res_reviewDate,
			Integer upnum, Integer idx, Integer res_star, Integer staravg) {
		super();
		this.res_reviewNum = res_reviewNum;
		this.res_reviewMsg = res_reviewMsg;
		this.res_reviewWriter = res_reviewWriter;
		this.res_reviewDate = res_reviewDate;
		this.upnum = upnum;
		this.idx = idx;
		this.res_star = res_star;
		this.staravg = staravg;
	}



	public resReviewVO(Integer res_reviewNum, String res_reviewMsg, String res_reviewWriter, Date res_reviewDate,
			Integer upnum, Integer idx, Integer res_star) {
		super();
		this.res_reviewNum = res_reviewNum;
		this.res_reviewMsg = res_reviewMsg;
		this.res_reviewWriter = res_reviewWriter;
		this.res_reviewDate = res_reviewDate;
		this.upnum = upnum;
		this.idx = idx;
		this.res_star = res_star;
	}



	public Integer getRes_star() {
		return res_star;
	}



	public void setRes_star(Integer res_star) {
		this.res_star = res_star;
	}



	public resReviewVO(Integer res_reviewNum, String res_reviewMsg, String res_reviewWriter, Date res_reviewDate,
			Integer upnum, Integer idx) {
		super();
		this.res_reviewNum = res_reviewNum;
		this.res_reviewMsg = res_reviewMsg;
		this.res_reviewWriter = res_reviewWriter;
		this.res_reviewDate = res_reviewDate;
		this.upnum = upnum;
		this.idx = idx;
	}



	@Override
	public String toString() {
		return "resReviewVO [res_reviewNum=" + res_reviewNum + ", res_reviewMsg=" + res_reviewMsg
				+ ", res_reviewWriter=" + res_reviewWriter + ", res_reviewDate=" + res_reviewDate + ", upnum=" + upnum
				+ ", idx=" + idx + ", res_star=" + res_star + "]";
	}



	public Integer getRes_reviewNum() {
		return res_reviewNum;
	}



	public void setRes_reviewNum(Integer res_reviewNum) {
		this.res_reviewNum = res_reviewNum;
	}



	public String getRes_reviewMsg() {
		return res_reviewMsg;
	}



	public void setRes_reviewMsg(String res_reviewMsg) {
		this.res_reviewMsg = res_reviewMsg;
	}



	public String getRes_reviewWriter() {
		return res_reviewWriter;
	}



	public void setRes_reviewWriter(String res_reviewWriter) {
		this.res_reviewWriter = res_reviewWriter;
	}



	public Date getRes_reviewDate() {
		return res_reviewDate;
	}



	public void setRes_reviewDate(Date res_reviewDate) {
		this.res_reviewDate = res_reviewDate;
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



	public resReviewVO() {
		// TODO Auto-generated constructor stub
	}

}
