package com.example.test;

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
import dto.Reply;
import service.ReplyService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })

public class ReplyServiceTest {
	
	static Logger logger = LoggerFactory.getLogger(ReplyServiceTest.class);
	@Autowired
	ReplyService service;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		List<Reply> re = service.selectReplyByBoardNo(262);
		logger.trace("re:{}",re);
		
	}
	@Test
	public void insertTest() {
		Reply re = new Reply(1,92,1,"제 마음에도 비가 오네요",null);
		int result = service.insertReply(re);
		logger.trace("성공여부:{}, re:{}",result,re);
		
	}

}
