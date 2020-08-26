package upload.model;

public class resfileVO {
	
	private Integer upinum;
	private String upiname;
	private Integer upnum;
	
	


	public resfileVO(Integer upinum, String upiname, Integer upnum) {
		super();
		this.upinum = upinum;
		this.upiname = upiname;
		this.upnum = upnum;
	}



	@Override
	public String toString() {
		return "resfileVO [upinum=" + upinum + ", upiname=" + upiname + ", upnum=" + upnum  + "]";
	}



	public Integer getUpinum() {
		return upinum;
	}



	public void setUpinum(Integer upinum) {
		this.upinum = upinum;
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



	public resfileVO() {
		
	}

}
