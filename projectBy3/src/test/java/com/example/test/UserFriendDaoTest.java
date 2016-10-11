package com.example.test;


import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import config.ApplicationConfig;
import dao.LocationDao;
import dao.UserDao;
import dao.UserFriendDao;
import dto.User;
import dto.UserFriend;
import dto.UserLocation;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
public class UserFriendDaoTest {

	static Logger logger = LoggerFactory.getLogger(UserFriendDaoTest.class);

	@Autowired
	UserFriendDao ufDao;
	
	@Test
	public void friendListTest(){
		List<UserFriend> friends = ufDao.friendList(2);
		logger.trace("친구 목록 : {}", friends);
//		assertThat(friends.size(), is(1));
	}
}
