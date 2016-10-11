package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.List;

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
	
	@Test
	public void friendListTest() {
		List<UserFriend> friends = service.friendList(2);
		logger.trace("friends : {}", friends);
		assertThat(friends.size(), is(1));
	}

}
