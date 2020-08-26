package board.model;

public class FileVO {

	private Integer mb_num;
	private Integer ob_num;
	private String fname;
	
	public FileVO(){
		
	}
	
	public FileVO(Integer mb_num, Integer ob_num, String fname) {
		super();
		this.mb_num = mb_num;
		this.ob_num = ob_num;
		this.fname = fname;
	}
	public Integer getMb_num() {
		return mb_num;
	}
	public void setMb_num(Integer mb_num) {
		this.mb_num = mb_num;
	}
	public Integer getOb_num() {
		return ob_num;
	}
	public void setOb_num(Integer ob_num) {
		this.ob_num = ob_num;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	@Override
	public String toString() {
		return "FileVO [mb_num=" + mb_num + ", ob_num=" + ob_num + ", fname=" + fname + "]";
	}
	
	
	
}
