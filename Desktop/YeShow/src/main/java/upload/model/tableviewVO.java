package upload.model;

public class tableviewVO {
	//예약시 보여주는 vo
	private Integer restime;//예약시간 저장
	private Integer restablenum;//테이블 번호
	private Integer restableuser;//테이블 인원수
	private Integer resmin;//분저장
	
	
	
	
	public tableviewVO(Integer restime, Integer restablenum, Integer restableuser, Integer resmin) {
		super();
		this.restime = restime;
		this.restablenum = restablenum;
		this.restableuser = restableuser;
		this.resmin = resmin;
	}



	public Integer getResmin() {
		return resmin;
	}



	public void setResmin(Integer resmin) {
		this.resmin = resmin;
	}



	public Integer getRestime() {
		return restime;
	}



	public void setRestime(Integer restime) {
		this.restime = restime;
	}



	public Integer getRestablenum() {
		return restablenum;
	}



	public void setRestablenum(Integer restablenum) {
		this.restablenum = restablenum;
	}



	public Integer getRestableuser() {
		return restableuser;
	}



	public void setRestableuser(Integer restableuser) {
		this.restableuser = restableuser;
	}

	


	public tableviewVO() {
		
	}



	public tableviewVO(Integer restime, Integer restableuser, Integer resmin) {
		super();
		this.restime = restime;
		this.restableuser = restableuser;
		this.resmin = resmin;
	}



	@Override
	public String toString() {
		return "tableviewVO [restime=" + restime + ", restablenum=" + restablenum + ", restableuser=" + restableuser
				+ ", resmin=" + resmin + "]";
	}




}
