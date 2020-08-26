package upload.model;

public class flagVO {

	private Integer flagnum;//플래그 넘버
	private Integer flag;//플래스 null ->1
	private Integer idx;//회원번호==업주 패널티를 준 업주
	private Integer num;//예약번호
	
	
	
	
	public flagVO(Integer flagnum,  Integer flag,  Integer idx, Integer num) {
		super();
		this.flagnum = flagnum;
		this.flag = flag;	
		this.idx = idx;
		this.num = num;
	}





	public Integer getFlagnum() {
		return flagnum;
	}





	public void setFlagnum(Integer flagnum) {
		this.flagnum = flagnum;
	}





	public Integer getFlag() {
		return flag;
	}





	public void setFlag(Integer flag) {
		this.flag = flag;
	}





	public Integer getIdx() {
		return idx;
	}





	public void setIdx(Integer idx) {
		this.idx = idx;
	}





	public Integer getNum() {
		return num;
	}





	public void setNum(Integer num) {
		this.num = num;
	}





	@Override
	public String toString() {
		return "flagVO [flagnum=" + flagnum + ", flag=" + flag + ", idx=" + idx + ", num=" + num + "]";
	}





	public flagVO() {
		
	}

}
