package test.model;

import java.io.Serializable;
import java.sql.Date;

public class ReNoteVO implements Serializable{
	
	private int re_QnA_idx;//답글번호
	private int qnA_idx;//원글번호
	private String re_QnA_Adminid;//답글 관리자 아이디
	private String re_QnA_content;
	private java.sql.Date wdate;
	private int idx;//답글관리자 번호
	
	public ReNoteVO(){
		
	}

	public ReNoteVO(int re_QnA_idx, int qnA_idx, String re_QnA_Adminid, String re_QnA_content, Date wdate, int idx) {
		super();
		this.re_QnA_idx = re_QnA_idx;
		this.qnA_idx = qnA_idx;
		this.re_QnA_Adminid = re_QnA_Adminid;
		this.re_QnA_content = re_QnA_content;
		this.wdate = wdate;
		this.idx = idx;
	}

	public int getRe_QnA_idx() {
		return re_QnA_idx;
	}

	public void setRe_QnA_idx(int re_QnA_idx) {
		this.re_QnA_idx = re_QnA_idx;
	}

	public int getQnA_idx() {
		return qnA_idx;
	}

	public void setQnA_idx(int qnA_idx) {
		this.qnA_idx = qnA_idx;
	}

	public String getRe_QnA_Adminid() {
		return re_QnA_Adminid;
	}

	public void setRe_QnA_Adminid(String re_QnA_Adminid) {
		this.re_QnA_Adminid = re_QnA_Adminid;
	}

	public String getRe_QnA_content() {
		return re_QnA_content;
	}

	public void setRe_QnA_content(String re_QnA_content) {
		this.re_QnA_content = re_QnA_content;
	}

	public java.sql.Date getWdate() {
		return wdate;
	}

	public void setWdate(java.sql.Date wdate) {
		this.wdate = wdate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	@Override
	public String toString() {
		return "ReNoteVO [re_QnA_idx=" + re_QnA_idx + ", qnA_idx=" + qnA_idx + ", re_QnA_Adminid=" + re_QnA_Adminid
				+ ", re_QnA_content=" + re_QnA_content + ", wdate=" + wdate + ", idx=" + idx + "]";
	}

	
}
