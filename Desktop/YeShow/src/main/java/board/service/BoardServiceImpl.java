package board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.model.BoardDAO;
import board.model.BoardVO;
import board.model.FileVO;
import board.model.PagingVO;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;

	public int insertBoard(BoardVO Board) {
		return boardDao.insertBoard(Board);
	}

	public int getTotalCount() {
		return boardDao.getTotalCount();
		
	}
	public int getTotalCount(PagingVO page) {
		return boardDao.getTotalCount(page);
	}

	public List<BoardVO> selectBoardAll(Map<String, Integer> map) {
		return boardDao.selectBoardAll(map);
		
	}

	public boolean updatemb_hits(Integer mb_num) {
		return boardDao.updatemb_hits(mb_num);
	}

	public BoardVO selectBoardBymb_num(Integer mb_num) {
		return boardDao.selectBoardBymb_num(mb_num);
	}

	public int insertfile(FileVO File) {
		return boardDao.insertfile(File);
	}

	public int deleteBoard(Integer mb_num) {
		return boardDao.deleteBoard(mb_num);
		
	}
	
	/*public String selectPwd(Integer idx) {
		return boardDao.selectPwd(idx);
	}*/

	public List<BoardVO> selectBoardAll(PagingVO paging) {
		return boardDao.selectBoardAll(paging);
	}

	public int updateBoard(BoardVO board) {
		return boardDao.updateBoard(board);
	}
	public int updatemb_recommand(Integer mb_num) {
		return boardDao.updatemb_recommand(mb_num);	
	}

	
	
}
