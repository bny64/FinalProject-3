package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import config.ApplicationConfig;
import dao.UserDao;
import dto.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
public class userDaoTest {

	static Logger logger = LoggerFactory.getLogger(userDaoTest.class);

	@Autowired
	UserDao uDao;

	//@Test
	public void selectUserTest() {
		// selectUser 테스트
		User user = uDao.selectUser("hong");
		assertThat(user.getUserName(), is("kildong"));
	}
	
	//@Test
	public void selectUserByNicknameTest(){
		User user = uDao.selectUserByNickname("hhh");
		assertThat(user.getUserName(), is("kildong"));
	}

	//@Test
	public void selectAllUserTest() {
		// selectAllUser 테스트
		List<User> users = uDao.selectAllUser();
		logger.trace("users : {}", users);
	}

	//@Test
	//@Transactional
	public void insertUserTest() throws ParseException {
		//insertUser 테스트
		String str = "88-12-12";
		SimpleDateFormat fdm = new SimpleDateFormat("yy-MM-dd");
		Date date = fdm.parse(str);
			User user = new User(0, "kang", "aabb", "hodong", "kanghodong",
												"010-000-0000", "abc@def", date);
			int result = uDao.insertUser(user);
			logger.trace("result : {}", result);
	}

}
