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
import dto.Category;
import service.CategoryService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
public class CategoryServiceTest {
	static Logger logger = LoggerFactory.getLogger(CategoryServiceTest.class);
	
	@Autowired
	CategoryService service;
	
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		List<Category> ct = service.selectAllCategory();
		logger.trace("ct :{}",ct);
	}

}
