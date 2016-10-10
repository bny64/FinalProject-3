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
import dto.UserCategory;
import service.UserCategoryService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
public class UserCategoryServiceTest {
	static Logger logger = LoggerFactory.getLogger(UserCategoryServiceTest.class);
	
	@Autowired
	UserCategoryService service;
	
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		List<UserCategory> ct = service.selectAllUserCategory();
		logger.trace("ct :{}",ct);
	}

}
