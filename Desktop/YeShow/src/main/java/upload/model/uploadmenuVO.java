package upload.model;

import java.io.Serializable;
import java.sql.Date;

public class uploadmenuVO implements Serializable {

	private Integer menunum;
	private String menuname;
	private Integer menuprice;
	private String menuinfo;
	private String menuimage;
	private Integer upnum;
	private Integer idx;
	
	
	
	
	


	public uploadmenuVO(Integer menunum, String menuname, Integer menuprice, String menuinfo, String menuimage,
			Integer upnum, Integer idx) {
		super();
		this.menunum = menunum;
		this.menuname = menuname;
		this.menuprice = menuprice;
		this.menuinfo = menuinfo;
		this.menuimage = menuimage;
		this.upnum = upnum;
		this.idx = idx;
	}




	public Integer getIdx() {
		return idx;
	}




	public void setIdx(Integer idx) {
		this.idx = idx;
	}




	@Override
	public String toString() {
		return "uploadmenuVO [menunum=" + menunum + ", menuname=" + menuname + ", menuprice=" + menuprice
				+ ", menuinfo=" + menuinfo + ", menuimage=" + menuimage + ", upnum=" + upnum + ", idx=" + idx + "]";
	}




	public uploadmenuVO(Integer menunum, String menuname, Integer menuprice, String menuinfo, String menuimage,
			Integer upnum) {
		super();
		this.menunum = menunum;
		this.menuname = menuname;
		this.menuprice = menuprice;
		this.menuinfo = menuinfo;
		this.menuimage = menuimage;
		this.upnum = upnum;
	}




	public Integer getMenunum() {
		return menunum;
	}




	public void setMenunum(Integer menunum) {
		this.menunum = menunum;
	}




	public String getMenuname() {
		return menuname;
	}




	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}




	public Integer getMenuprice() {
		return menuprice;
	}




	public void setMenuprice(Integer menuprice) {
		this.menuprice = menuprice;
	}




	public String getMenuinfo() {
		return menuinfo;
	}




	public void setMenuinfo(String menuinfo) {
		this.menuinfo = menuinfo;
	}




	public String getMenuimage() {
		return menuimage;
	}




	public void setMenuimage(String menuimage) {
		this.menuimage = menuimage;
	}




	public Integer getUpnum() {
		return upnum;
	}




	public void setUpnum(Integer upnum) {
		this.upnum = upnum;
	}




	public uploadmenuVO() {
		
	}

}
