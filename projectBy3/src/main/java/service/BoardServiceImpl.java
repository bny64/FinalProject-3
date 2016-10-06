package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import dto.Board;

@Service
public class BoardServiceImpl implements BoardService{
	static Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Autowired
	BoardDao board;
	
	@Override
	public List<Board> viewAllBoards() {
		logger.trace("BoardServiceImpl - viewAllBoards() 동작");
		return board.selectAllBoard();
	}

	@Override
	public Board selectBoard(int boardNo) {
		//boardNo로 Board객체 하나 검색
		logger.trace("BoardServiceImpl - selectBoard() 동작");
		return board.selectBoard(boardNo);
	}

	@Override
	public List<Board> selectMyBoard(int userNo) {
		//userNo로 내가 쓴 Board 리스트로 검색
		logger.trace("BoardServiceImpl - selectMyBoard() 동작");
		return board.selectMyBoard(userNo);
	}
	
	@Override
	public List<Board> selectMyBoardByPaging(int userNo, int pageNo) {
		logger.trace("BoardServiceImpl - selectAllBoardByPaging() 동작");
		Map<String, Object> filter = new HashMap<>();
		filter.put("from", 9*pageNo-8);
		filter.put("to", 9*pageNo);
		filter.put("userNo", userNo);
		return board.selectMyBoardByPaging(filter);
	}

	@Override
	public List<Board> selectAllBoardByPaging(int pageNo) {
		// TODO Auto-generated method stub
		logger.trace("BoardServiceImpl - selectAllBoardByPaging() 동작");
		Map<String, Object> filter = new HashMap<>();
		filter.put("from", 9*pageNo-8);
		filter.put("to", 9*pageNo);
		return board.selectAllBoardByPaging(filter);
	}

	@Override
	public int deleteBoardByBoardNo(int boardNo) {
		logger.trace("BoardServiceImpl - deleteBoardByBoardNo() 동작");		
		return board.deleteBoardByBoardNo(boardNo);
	}

	

}
