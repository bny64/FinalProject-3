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

	@Test
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
	
	@Test
	public void selectAllBoardByPagingTest(){
		int pageNo = 1;
		List<Board> boards = service.selectAllBoardByPaging(pageNo);
		logger.trace("boards.size() : {}", boards.size());
		//assertThat(boards.size(), is(9));
	}
	
	
	@Test
	public void deleteBoardByBoardNo(){
		int result = service.deleteBoardByBoardNo(53);
		Board board = service.selectBoard(53);
		logger.trace("board : {}", board);
		assertThat(result, is(1));
	}
	
	
	@Test
	@Transactional
	public void updateBoard(){
		
		Board board = new Board();
		board.setBoardNo(1);
		board.setTitle("나는 은구다");
		board.setContent("이것은 수정이다");
		board.setCategoryNo(1);
		board.setImagePath("null");
		
		int result = service.updateBoard(board);
		logger.trace("update result : {}",result);		
				
		assertThat(result, is(1));
	}
	
	
	@Test	
	public void insertBoard(){
		
		Board board = new Board();	
		board.setUserNo(2);
		board.setTitle("나는 은구다2222");
		board.setContent("이것은 insert 다");
		board.setCategoryNo(1);
		board.setImagePath("/img/thumbs/01.jpg");
		
		int result = service.insertBoard(board);
		logger.trace("insertBoard result : {}",result);		
				
		assertThat(result, is(1));
	}
	@Test	
	public void searchByTitleContent(){
		List<Board> board = service.searchByTitleContent(1, "은구");
		logger.trace("은구로 검색 한 board : {} ",board);
	}
	
	@Test
	public void selectMyBoardByPagingTest(){
		List<Board> boards = service.selectMyBoardByPaging(23, 1);
		logger.trace("boards : {}", boards);
	}
	
	
}
