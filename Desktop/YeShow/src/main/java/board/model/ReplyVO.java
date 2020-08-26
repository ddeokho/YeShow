package board.model;

import java.sql.Timestamp;

public class ReplyVO {

	private Integer rmb_num;//답글 게시판 번호
	private Integer mb_num;// 회원 게시판 번호
	private Integer idx;// 회원 번호
	private String rmb_contents; // 내용
	private String rmb_image; // 이미지
	private java.sql.Timestamp wdate;//등록일
	
	
	public ReplyVO(Integer rmb_num, Integer mb_num, Integer idx, String rmb_contents, String rmb_image,
			Timestamp wdate) {
		super();
		this.rmb_num = rmb_num;
		this.mb_num = mb_num;
		this.idx = idx;
		this.rmb_contents = rmb_contents;
		this.rmb_image = rmb_image;
		this.wdate = wdate;
	}


	public Integer getRmb_num() {
		return rmb_num;
	}


	public void setRmb_num(Integer rmb_num) {
		this.rmb_num = rmb_num;
	}


	public Integer getMb_num() {
		return mb_num;
	}


	public void setMb_num(Integer mb_num) {
		this.mb_num = mb_num;
	}


	public Integer getIdx() {
		return idx;
	}


	public void setIdx(Integer idx) {
		this.idx = idx;
	}


	public String getRmb_contents() {
		return rmb_contents;
	}


	public void setRmb_contents(String rmb_contents) {
		this.rmb_contents = rmb_contents;
	}


	public String getRmb_image() {
		return rmb_image;
	}


	public void setRmb_image(String rmb_image) {
		this.rmb_image = rmb_image;
	}


	public java.sql.Timestamp getWdate() {
		return wdate;
	}


	public void setWdate(java.sql.Timestamp wdate) {
		this.wdate = wdate;
	}


	@Override
	public String toString() {
		return "ReplyVO [rmb_num=" + rmb_num + ", mb_num=" + mb_num + ", idx=" + idx + ", rmb_contents=" + rmb_contents
				+ ", rmb_image=" + rmb_image + ", wdate=" + wdate + "]";
	}
	
	
	
	
	
}
