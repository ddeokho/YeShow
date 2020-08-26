package upload.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import upload.model.*;

@Service
public class uploadmenuServiceImpl implements uploadmenuService {

	@Autowired
	private uploadmenuDAO menuDAO;
	
	//메뉴등록
	public int insertMenu(uploadmenuVO menu) {
		
		return menuDAO.insertMenu(menu);
	}
	
	
	public List<uploadmenuVO> selectAllMenu(Integer upnum) {
		
		return menuDAO.selectAllMenu(upnum);
	}

	public int deleteMenu(Integer menudel) {
		
		return menuDAO.deleteMenu(menudel);
	}

	public int updateMenu(Integer upnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	//리뷰등록
	public int insertresReview(resReviewVO menu) {
		
		return menuDAO.insertresReview(menu);
	}

	public List<resReviewVO> selectAllresReview(Integer upnum) {
		
		return menuDAO.selectAllresReview(upnum);
	}

	public int deleteresReview(Integer delnum) {
		
		return menuDAO.deleteresReview(delnum);
	}

	public List<uploadVO> selectAllImg(int upnum) {
		
		return menuDAO.selectAllImg(upnum);
	}


	public List<leastmenupriceVO> selectmenuprice() {
		
		return menuDAO.selectmenuprice();
	}


	public int insertTable(tableupVO tableup) {
		
		return menuDAO.insertTable(tableup);
	}



	public List<tableupVO> selectTableQ(int upnum) {
		
		return menuDAO.selectTableQ(upnum);
	}


	public int delTable(int upnum) {
		
		return menuDAO.delTable(upnum);
	}

}
