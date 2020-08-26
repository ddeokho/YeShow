package test.model;

import java.util.Arrays;

public class ImgVO {
	
	private String[] Img1=new String[4];
	
	public ImgVO(){
		
	}

	public String[] getImg1() {
		return Img1;
	}

	public void setImg1(String[] img1) {
		Img1 = img1;
	}
	
	public void setImages(String ... img){
		Img1=img;
	}

	@Override
	public String toString() {
		return "ImgVO [Img1=" + Arrays.toString(Img1) + "]";
	}
		
}
