package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import config.ApplicationConfig;
import dto.User;
import service.Service;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={ApplicationConfig.class})
public class serviceTest {

	static Logger logger = LoggerFactory.getLogger(serviceTest.class);
	
	@Autowired
	Service service;
	
	//@Test
	public void loginServiceTest(){
		//유저 로그인 테스트
		User user = service.loginUser("bny64", "1234");
		assertThat(user.getNickname(), is("sunday"));
		logger.trace("user : {}", user);
	}
	
	//@Test
	public void loginFailTestById(){
		//유저 아이디 오류 테스트
		User user = service.loginUser("ddss121", "1111");
		logger.trace("user : {}", user);
	}
	
	//@Test
	public void loginFailTestByPass(){
		//유저 비밀번호 오류 테스트
		User user = service.loginUser("bny64", "2344");
		logger.trace("user : {}", user);
	}

}
