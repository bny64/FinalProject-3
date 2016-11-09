package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import config.ApplicationConfig;
import dao.BoardLoactionDao;
import dto.Board;
import dto.BoardLocation;
import service.BoardLoactionService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
public class BoardLoactionTest {
	static Logger logger = LoggerFactory.getLogger(BoardLoactionTest.class);
	@Autowired
	BoardLoactionService service;
	
	@Autowired 
	BoardLoactionDao dao;
	
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
	
	@Test
	public void getBoardsBycenterLocationDaoTest(){
		Map<String,Object> filter = new HashMap<>();
		
		filter.put("centerLat", (float) 36.81506854521463);
		filter.put("centerLng", (float) 127.11321711527751);
		filter.put("range", (float) 0.0050);
		
		List<BoardLocation> BoardLocations = dao.getBoardsBycenterLocation(filter);
		
		logger.trace("BoardLocations size : {}", BoardLocations.size());
	}

	@Test
	public void getBoardsBycenterLocationServiceTest(){
		Map<String,Object> filter = new HashMap<>();
		float centerLat = (float)36.81512;
		float centerLng = (float)127.1142;
		float range = (float) 0.0050;
		int userNo = 2;
		
		filter.put("centerLat", centerLat);
		filter.put("centerLng", centerLng);
		filter.put("range", range);
		filter.put("userNo", userNo);
		
		List<Board> boards = service.getBoardsBycenterLocation(filter);
		
		logger.trace("boards : {}" , boards);
	}
	
}
