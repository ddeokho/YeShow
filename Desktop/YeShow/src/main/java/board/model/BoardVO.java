package board.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class BoardVO implements Serializable{

	private Integer mb_num;//회원 게시판 번호
	private Integer idx;// 회원 번호
	private Integer upnum;//업로드 번호
	private String mb_title;// 제목
	private String mb_userid;// 작성자
	private String mb_contents;// 내용
	private int mb_recommand;// 추천수(좋아요)
	private int mb_score;// 별점
	private int mb_hits;// 조회수
	private String mb_select;// 말머리(자유글/리뷰글)
	private java.sql.Timestamp mb_indate;//등록일
	
	public BoardVO(){
		
	}
	
	
	public BoardVO(Integer mb_num, Integer idx, Integer upnum, String mb_title, String mb_userid, String mb_contents,
			int mb_recommand, int mb_score, int mb_hits, String mb_select, Timestamp mb_indate) {
		super();
		this.mb_num = mb_num;
		this.idx = idx;
		this.upnum = upnum;
		this.mb_title = mb_title;
		this.mb_userid = mb_userid;
		this.mb_contents = mb_contents;
		this.mb_recommand = mb_recommand;
		this.mb_score = mb_score;
		this.mb_hits = mb_hits;
		this.mb_indate = mb_indate;
		this.mb_select = mb_select;
		
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
	public Integer getUpnum() {
		return upnum;
	}
	public void setUpnum(Integer upnum) {
		this.upnum = upnum;
	}
	public String getMb_title() {
		return mb_title;
	}
	public void setMb_title(String mb_title) {
		this.mb_title = mb_title;
	}
	public String getMb_userid() {
		return mb_userid;
	}
	public void setMb_userid(String mb_userid) {
		this.mb_userid = mb_userid;
	}
	public String getMb_contents() {
		return mb_contents;
	}
	public void setMb_contents(String mb_contents) {
		this.mb_contents = mb_contents;
	}
	public int getMb_recommand() {
		return mb_recommand;
	}
	public void setMb_recommand(int mb_recommand) {
		this.mb_recommand = mb_recommand;
	}
	public int getMb_score() {
		return mb_score;
	}
	public void setMb_score(int mb_score) {
		this.mb_score = mb_score;
	}
	public int getMb_hits() {
		return mb_hits;
	}
	public void setMb_hits(int mb_hits) {
		this.mb_hits = mb_hits;
	}
	
	public String getMb_select() {
		return mb_select;
	}

	public void setMb_select(String mb_select) {
		this.mb_select = mb_select;
	}


	public java.sql.Timestamp getMb_indate() {
		return mb_indate;
	}
	public void setMb_indate(java.sql.Timestamp mb_indate) {
		this.mb_indate = mb_indate;
	}
	
	@Override
	public String toString() {
		return "BoardVO [mb_num=" + mb_num + ", idx=" + idx + ", upnum=" + upnum + ", mb_title=" + mb_title
				+ ", mb_userid=" + mb_userid + ", mb_contents=" + mb_contents + ", mb_recommand=" + mb_recommand
				+ ", mb_score=" + mb_score + ", mb_hits=" + mb_hits +"mb_select=" + mb_select +", mb_indate=" + mb_indate + "]";
	}
	
	
	
}
