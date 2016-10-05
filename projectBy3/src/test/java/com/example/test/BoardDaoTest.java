package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import config.ApplicationConfig;
import dao.BoardDao;
import dao.UserDao;
import dto.Board;
import dto.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
public class BoardDaoTest {

	static Logger logger = LoggerFactory.getLogger(BoardDaoTest.class);

	@Autowired
	BoardDao bDao;

	//@Test
	public void selectAllBoardTest() {
		List<Board> boards = bDao.selectAllBoard();
		logger.trace("boards.size : {}", boards.size()); 
		assertThat(boards.size(), is(notNullValue()));
	}
	
	//@Test
	public void selectBoardTest(){
		Board board = bDao.selectBoard(1);
		logger.trace("board : {}", board);
		assertThat(board.getTitle(), is(notNullValue()));
	}
	
	@Test
	public void selectMyBoardTest(){
		List<Board> boards = bDao.selectMyBoard(2);
		logger.trace("boards.size : {}", boards.size());
		assertThat(boards.size(), is(3));
	}
}
