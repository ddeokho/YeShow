package test.model;

import java.io.Serializable;
import java.sql.Date;

public class NoteVO implements Serializable{
	
	private int qna_idx;
	private int idx;
	private String qna_userid;
	private String qna_title;
	private String qna_content;
	private String qna_Img1;
	private String qna_Img2;
	private String qna_Img3;
	private String qna_Img4;
	private String ch;//
	private java.sql.Date wdate;
	
	public NoteVO(){
		
	}

	public NoteVO(int qna_idx, int idx, String qna_userid, String qna_title, String qna_content, String qna_Img1,
			String qna_Img2, String qna_Img3, String qna_Img4, String ch, Date wdate) {
		super();
		this.qna_idx = qna_idx;
		this.idx = idx;
		this.qna_userid = qna_userid;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_Img1 = qna_Img1;
		this.qna_Img2 = qna_Img2;
		this.qna_Img3 = qna_Img3;
		this.qna_Img4 = qna_Img4;
		this.ch = ch;
		this.wdate = wdate;
	}

	public int getQna_idx() {
		return qna_idx;
	}

	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getQna_userid() {
		return qna_userid;
	}

	public void setQna_userid(String qna_userid) {
		this.qna_userid = qna_userid;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_Img1() {
		return qna_Img1;
	}

	public void setQna_Img1(String qna_Img1) {
		this.qna_Img1 = qna_Img1;
	}

	public String getQna_Img2() {
		return qna_Img2;
	}

	public void setQna_Img2(String qna_Img2) {
		this.qna_Img2 = qna_Img2;
	}

	public String getQna_Img3() {
		return qna_Img3;
	}

	public void setQna_Img3(String qna_Img3) {
		this.qna_Img3 = qna_Img3;
	}

	public String getQna_Img4() {
		return qna_Img4;
	}

	public void setQna_Img4(String qna_Img4) {
		this.qna_Img4 = qna_Img4;
	}

	public String getCh() {
		return ch;
	}

	public void setCh(String ch) {
		this.ch = ch;
	}

	public java.sql.Date getWdate() {
		return wdate;
	}

	public void setWdate(java.sql.Date wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "NoteVO [qna_idx=" + qna_idx + ", idx=" + idx + ", qna_userid=" + qna_userid + ", qna_title=" + qna_title
				+ ", qna_content=" + qna_content + ", qna_Img1=" + qna_Img1 + ", qna_Img2=" + qna_Img2 + ", qna_Img3="
				+ qna_Img3 + ", qna_Img4=" + qna_Img4 + ", ch=" + ch + ", wdate=" + wdate + "]";
	}
	
}
