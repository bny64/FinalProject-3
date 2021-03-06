package com.example.test;


import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import config.ApplicationConfig;
import dao.LocationDao;
import dto.UserLocation;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
public class locationDaoTest {

	static Logger logger = LoggerFactory.getLogger(locationDaoTest.class);

	@Autowired
	LocationDao lDao;
	
	@Test
	public void selectUserLocationTest(){
		List<UserLocation> location = new ArrayList<>();
		location = lDao.userAllLocation(2);
		logger.trace("유저의 location : {}", location);
		assertThat(location.size(), is(1));
	}

	//@Test
	public void insertUserLocationTest() throws ParseException{
		String str = "88-12-12";
		SimpleDateFormat fdm = new SimpleDateFormat("yy-MM-dd");
		Date date = fdm.parse(str);
		UserLocation userLocation = new UserLocation(0, "location1",date, 1000,1000,2);
		int result = lDao.insertUserLocation(userLocation);
		logger.trace("등록된 값 : {}", userLocation);
		assertThat(result, is(1));
	}
}
