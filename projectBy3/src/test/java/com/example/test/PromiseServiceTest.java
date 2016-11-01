package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import config.ApplicationConfig;
import dto.Promise;
import service.PromiseService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })

public class PromiseServiceTest {

	static Logger logger = LoggerFactory.getLogger(PromiseServiceTest.class);
	
	@Autowired
	PromiseService service;

	@Test
	public void insertPromiseTest() throws ParseException {
		String str = "16-12-01";
		SimpleDateFormat fdm = new SimpleDateFormat("yy-MM-dd");
		Date date = fdm.parse(str);
		Promise promise = new Promise(1, "은구와 민국의 약속", 2, 1, date, 36, 126, "우리 만날래?", "약속 중");
		int result = service.insertPromise(promise);
		assertThat(result, is(1));
	}
	
	@Test
	public void updatePromiseTest() throws ParseException{
		
		int result;
		
		String str = "16-10-28";
		SimpleDateFormat fdm = new SimpleDateFormat("yy-MM-dd");
		Date date = fdm.parse(str);
		
		Map<String, Object> ProAndDate = new HashMap<>();
		ProAndDate.put("promoter", 1);
		ProAndDate.put("promiseDate", date);
		
		Promise promise = new Promise(0, "민국과 은구의 약속", 2, 1, date, 38, 129, "장소 변경 하자", "약속 중");
		
		result = service.updatePromise(ProAndDate, promise);

		assertThat(result, is(1));
	}

}
