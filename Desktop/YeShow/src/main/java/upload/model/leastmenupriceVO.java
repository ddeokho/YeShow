package upload.model;

public class leastmenupriceVO {

	private Integer leastprice;
	private Integer upnum;
	
	
	public leastmenupriceVO(Integer leastprice, Integer upnum) {
		super();
		this.leastprice = leastprice;
		this.upnum = upnum;
	}



	public Integer getUpnum() {
		return upnum;
	}



	public void setUpnum(Integer upnum) {
		this.upnum = upnum;
	}



	public leastmenupriceVO(Integer leastprice) {
		super();
		this.leastprice = leastprice;
	}



	public Integer getLeastprice() {
		return leastprice;
	}



	public void setLeastprice(Integer leastprice) {
		this.leastprice = leastprice;
	}



	public leastmenupriceVO() {
		
	}

}
