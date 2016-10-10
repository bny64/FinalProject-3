package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import java.util.Locale;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.config.ApplicationConfig;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={ApplicationConfig.class})
public class MessageSourceTest {

	static Logger logger = LoggerFactory.getLogger(MessageSourceTest.class);
	@Autowired
	MessageSource ms;
	
	@Test
	public void messageTest(){
		Locale locale = null;
		locale = Locale.ENGLISH;
		locale = Locale.KOREA;
		logger.trace("file.name : {}", ms.getMessage("file.name", null, locale));
		logger.trace("error.some : {}", ms.getMessage("error.some", null, locale));
		logger.trace("error.404 : {}", ms.getMessage("error.404", new Object[]{"hello.txt"}, locale));
		assertThat(ms, is(notNullValue()));
	}

}
