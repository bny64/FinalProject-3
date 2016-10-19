package com.example.test;

import static org.junit.Assert.*;

import java.util.List;

import static org.hamcrest.CoreMatchers.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import config.ApplicationConfig;
import dao.PromiseDao;
import dto.Promise;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={ApplicationConfig.class})
public class PromiseDaoTest {
	static Logger logger = LoggerFactory.getLogger(PromiseDaoTest.class);
	
	@Autowired
	PromiseDao pDao;

	@Test
	public void getAllPromiseTest() {
		List<Promise> allPromise = pDao.getAllPromise();
		logger.trace("allPromise size : {}", allPromise.size());
	}
	
	@Test
	public void getMyPromiseByPromoteTest() {
		List<Promise> allPromise = pDao.getMyPromiseByPromote(2);
		logger.trace("size : {}", allPromise.size());
	}
	
	@Test
	public void getMyPromiseByInviteeTest() {
		List<Promise> allPromise = pDao.getMyPromiseByInvitee(1);
		logger.trace("size : {}", allPromise.size());
	}

}
