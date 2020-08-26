package test.model;

import java.io.Serializable;
import java.sql.Date;

public class NoticeVO implements Serializable {

	private int idx; //공지글 번호
	private int admin_idx; //관리자 번호 참조키
	private String adminid; //공지등록관리자 아이디
	private String ntitle; //공지 제목
	private String contents; //공지 내용
	private java.sql.Date wdate; //공지등록일
	
	public NoticeVO(){
		
	}

	public NoticeVO(int idx, int admin_idx, String adminid, String ntitle, String contents, Date wdate) {
		super();
		this.idx = idx;
		this.admin_idx = admin_idx;
		this.adminid = adminid;
		this.ntitle = ntitle;
		this.contents = contents;
		this.wdate = wdate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getAdmin_idx() {
		return admin_idx;
	}

	public void setAdmin_idx(int admin_idx) {
		this.admin_idx = admin_idx;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public java.sql.Date getWdate() {
		return wdate;
	}

	public void setWdate(java.sql.Date wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "NoticeVO [idx=" + idx + ", admin_idx=" + admin_idx + ", adminid=" + adminid + ", ntitle=" + ntitle
				+ ", contents=" + contents + ", wdate=" + wdate + "]";
	}
	
}
