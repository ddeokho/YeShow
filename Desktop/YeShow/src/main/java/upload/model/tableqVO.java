package upload.model;

public class tableqVO {

	private Integer tableuser;// 테이블 인수(4인)
	private Integer tnumber;//테이블 개수
	
	
	
	public tableqVO(Integer tableuser, Integer tnumber) {
		super();
		this.tableuser = tableuser;
		this.tnumber = tnumber;
	}



	public Integer getTableuser() {
		return tableuser;
	}



	public void setTableuser(Integer tableuser) {
		this.tableuser = tableuser;
	}



	public Integer getTnumber() {
		return tnumber;
	}
	


	public void setTnumber(Integer tnumber) {
		this.tnumber = tnumber;
	}



	@Override
	public String toString() {
		return "tableqVO [tableuser=" + tableuser + ", tnumber=" + tnumber + "]";
	}



	public tableqVO() {
		// TODO Auto-generated constructor stub
	}

}
