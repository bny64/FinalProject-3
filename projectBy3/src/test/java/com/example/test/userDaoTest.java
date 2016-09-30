package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import config.ApplicationConfig;
import dao.UserDao;
import dao.UserDaoImpl;
import dto.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={ApplicationConfig.class})
public class userDaoTest {

	@Autowired
	UserDao uDao;
	
	@Test
	public void selectUserDaoTest() {
		User user = uDao.selectUser("bny64");
		assertThat(user.getUserName(), is("홍길동"));
	}

}
