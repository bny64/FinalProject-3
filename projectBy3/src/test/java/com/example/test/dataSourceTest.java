package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import config.ApplicationConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
public class dataSourceTest {
	static Logger logger = LoggerFactory.getLogger(dataSourceTest.class);
	
	@Autowired
	DataSource ds;
	@Autowired
	SqlSessionFactoryBean sessionbean;
	@Autowired
	SqlSessionTemplate template;
	
	@Test
	public void dataSourceTest1() {
		logger.trace("datasource : {}", ds);
		assertThat(ds, is(notNullValue()));
		logger.trace("sessionbean : {}", sessionbean);
		assertThat(sessionbean, is(notNullValue()));
		logger.trace("template : {}", template);
		assertThat(template, is(notNullValue()));
	}

}
