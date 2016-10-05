package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.CoreMatchers.nullValue;
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
import service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
public class BoardServiceTest {

	static Logger logger = LoggerFactory.getLogger(BoardServiceTest.class);

	@Autowired
	BoardService service;

	//@Test
	public void viewAllBoards() {
		List<Board> boards = service.viewAllBoards();
		logger.trace("boards.size : {}", boards.size()); 
		assertThat(boards.size(), is(notNullValue()));
	}
	
	@Test
	public void viewBoard(){
		Board board = service.selectBoard(1);
		logger.trace("board : {}", board);
		assertThat(board, is(notNullValue()));
		assertThat(service.selectBoard(4), is(nullValue()));
	}
	
	@Test
	public void viewMyBoard(){
		List<Board> boards = service.selectMyBoard(2);
		logger.trace("boards.size() : {}", boards.size());
		assertThat(boards.size(), is(3));
	}
}
