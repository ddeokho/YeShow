package upload.model;


public class resviewVO {

	private Integer review;//리뷰개수
	private Integer star;//별점
	private Integer upnum;//업로드번호
	
	
	public resviewVO(Integer review, Integer star, Integer upnum) {
		super();
		this.review = review;
		this.star = star;
		this.upnum = upnum;
	}



	public Integer getUpnum() {
		return upnum;
	}



	public void setUpnum(Integer upnum) {
		this.upnum = upnum;
	}



	public resviewVO(Integer review, Integer star) {
		super();
		this.review = review;
		this.star = star;
	}



	@Override
	public String toString() {
		return "resviewVO [review=" + review + ", star=" + star + ", upnum=" + upnum + "]";
	}



	public Integer getReview() {
		return review;
	}



	public void setReview(Integer review) {
		this.review = review;
	}



	public Integer getStar() {
		return star;
	}



	public void setStar(Integer star) {
		this.star = star;
	}



	public resviewVO() {
		
	}

}
