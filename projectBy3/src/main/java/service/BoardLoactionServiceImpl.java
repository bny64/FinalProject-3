package service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.BoardLoactionDao;
import dto.BoardLocation;

@Service
@Transactional(timeout=60)
public class BoardLoactionServiceImpl implements BoardLoactionService{
	static Logger logger = LoggerFactory.getLogger(BoardLoactionServiceImpl.class);
	
	@Autowired
	BoardLoactionDao boardlocationDao;
	
	@Override
	public BoardLocation selectBoard(int boradNo) {
		logger.trace("BoardLoactionServiceImpl - selectBoard");
		return boardlocationDao.selectBoard(boradNo);
	}

	@Override
	public int insertBoardLocation(BoardLocation boardLocation) {
		logger.trace("BoardLoactionServiceImpl - insertBoardLocation");
		return boardlocationDao.insertBoardLocation(boardLocation);
		
	}

}
