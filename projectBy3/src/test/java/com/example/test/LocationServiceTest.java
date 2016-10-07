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
import dto.User;
import dto.UserLocation;
import exception.IdDuplicatedException;
import exception.IdFailException;
import exception.NicknameDuplicatedException;
import exception.passFailException;
import service.LocationService;
import service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={ApplicationConfig.class})
public class LocationServiceTest {

	static Logger logger = LoggerFactory.getLogger(LocationServiceTest.class);
	
	@Autowired
	LocationService service;
	
	@Test
	public void userAllLocationTest(){
		List<UserLocation> userLocation = service.userAllLocation(3);
		logger.trace("검색한 유저의 로케이션 : {}", userLocation);
		assertThat(userLocation.size(), is(1));
		assertThat(userLocation.get(0).getUserLocationNo(), is(2));
	}
	
	@Test
	public void insertUserLocationTest() throws ParseException{
		String str = "99-02-12";
		SimpleDateFormat fdm = new SimpleDateFormat("yy-MM-dd");
		Date date = fdm.parse(str);
		UserLocation userLocation = new UserLocation(0, date, 1000,1000,2);
		int result = service.insertUserLocation(userLocation);
		logger.trace("등록된 값 : {}", userLocation);
		assertThat(result, is(1));
	}
}
