package com.example.test;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import config.ApplicationConfig;
import service.HotBoardService;
import dto.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
public class HotBoardServiceTest {
	static Logger logger = LoggerFactory.getLogger(HotBoardServiceTest.class);
	@Autowired
	HotBoardService service;
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		List<HotBoard> hot = service.selectHotBoardByCategory(38);
		logger.trace("핫:{}",hot);
	}
	
	@Test
	public void insertTest() {
		HotBoard hot = new HotBoard(1,1,"ㅇㅅㅇ","ㅇㅅㅇ;;","파일",null);
		int result = service.insertHotBoard(hot);
		logger.trace("성공:{},핫:{}",result,hot);
	}

}
