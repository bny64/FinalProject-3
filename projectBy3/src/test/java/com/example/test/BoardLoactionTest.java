package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import config.ApplicationConfig;
import dto.BoardLocation;
import service.BoardLoactionService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
public class BoardLoactionTest {
	static Logger logger = LoggerFactory.getLogger(BoardLoactionTest.class);
	@Autowired
	BoardLoactionService service;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void selectTest(){
		BoardLocation board = service.selectBoard(21);
		logger.trace("aa : {}", board);
	}
	
	@Test
	public void insertTest() {
		BoardLocation b = new BoardLocation();
		float l = (float) 36.815129;
		float lo = (float)127.11389389;
		b.setLatitude(l);
		b.setLongitude(lo);
		b.setBoardNo(22);
		int re = service.insertBoardLocation(b);
		
		logger.trace("re:{}",re);
		
		
		assertThat(re, is(1));
	}

}
