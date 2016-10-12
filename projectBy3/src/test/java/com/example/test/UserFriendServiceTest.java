package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

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

import config.ApplicationConfig;
import dto.UserFriend;
import service.UserFriendService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={ApplicationConfig.class})
public class UserFriendServiceTest {

	static Logger logger = LoggerFactory.getLogger(UserFriendServiceTest.class);
	
	@Autowired
	UserFriendService service;
	
	//@Test
	public void friendListTest() {
		List<UserFriend> friends = service.friendList(2);
		logger.trace("friends : {}", friends);
		assertThat(friends.size(), is(1));
	}

	@Test
	public void updateAlarmTest(){
		int result;
		Map<String, Object> friend = new HashMap<>();
		friend.put("alarm", "off");
		friend.put("friendNo", 1);
		result = service.updateAlarm(friend);
		logger.trace("result : {}", result);
	}
	
	//@Test
	public void selectAlarmTest(){
		String result = service.selectAlarm(1);
		logger.trace("result : {}", result);
		assertThat(result.toString(), is("on"));
	}
	
	//@Test
	public void deleteFriendTest(){
		int result = service.deleteFriend(1);
		logger.trace("result : {}", result);
		assertThat(result, is(1));
	}
	
	@Test(expected=exception.FriendNotFoundException.class)
	public void insertFriendTest(){
		int result = service.insertFriend(2, 1);
		logger.trace("result : {}", result);
		assertThat(result, is(1));
	}
}
