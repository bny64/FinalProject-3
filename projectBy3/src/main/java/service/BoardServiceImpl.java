package service;

import java.util.List;

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

}
