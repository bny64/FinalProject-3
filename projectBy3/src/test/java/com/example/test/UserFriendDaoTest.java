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
	
	@Test
	public void updateAlarmTest(){
		int result;
		Map<String, Object> friend = new HashMap<>();
		friend.put("alarm", "off");
		friend.put("friendNo", 1);
		result = ufDao.updateAlarm(friend);
		logger.trace("result : {}", result);
	}
	@Test
	public void selectAlarmTest(){
		String alarm = ufDao.selectAlarm(1);
		logger.trace("result : {}", alarm);
	}
	
	@Test
	@Transactional
	public void deleteFriendTest(){
		int result = ufDao.deleteFriend(1);
		logger.trace("result : {}", result);
	}
	
	@Test
	public void insertFriendTest(){
		UserFriend userFriend = new UserFriend(0,3,"unknown",1,"on","",null);
		int result = ufDao.insertFriend(userFriend);
		logger.trace("result : {}", result);
		assertThat(result, is(1));
	}
}
