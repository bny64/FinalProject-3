package com.example.test;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
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
import exception.IdFailException;
import exception.NicknameDuplicatedException;
import service.UserHistoryService;
import service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={ApplicationConfig.class})
public class UserServiceTest {

	static Logger logger = LoggerFactory.getLogger(UserServiceTest.class);
	
	@Autowired
	UserService service;
	@Autowired
	UserHistoryService ss;
	
	//@Test
	public void loginServiceTest(){
		//유저 로그인 테스트
		User user = service.loginUser("hong", "1234");
		assertThat(user.getNickname(), is("hhh"));
		logger.trace("user : {}", user);
	}
	
	//@Test(expected=IdFailException.class)
	public void loginFailTestById(){
		//유저 아이디 오류 테스트
		User user = service.loginUser("ddss121", "1111");
		logger.trace("user : {}", user);
	}
	
	//@Test(expected=passFailException.class)
	public void loginFailTestByPass(){
		//유저 비밀번호 오류 테스트
		User user = service.loginUser("lee", "2344");
		logger.trace("user : {}", user);
	}
	
	@Test
	public void AllUserTest(){
		//전체 회원 조회 테스트
		List<User> users = service.AllUser();
		logger.trace("users : {}", users);
	}
	
	//@Test
	//@Transactional
	public void insertUserTest() throws ParseException{
		//회원 입력 테스트
		String str = "88-12-12";
		SimpleDateFormat fdm = new SimpleDateFormat("yy-MM-dd");
		Date date = fdm.parse(str);
			User user = new User(0, "kang", "aabb", "hodong", "kanghodong",
												"010-000-0000", "abc@def", date,"",null);
			int result = service.insertUser(user);
			assertThat(result, is(1));
			logger.trace("result : {}", result);
	}
	
	//@Test(expected=IdDuplicatedException.class)
	//@Transactional
	public void insertUserDuplicateByIdTest() throws ParseException{
		//아이디 중복 오류 테스트
		String str = "88-12-12";
		SimpleDateFormat fdm = new SimpleDateFormat("yy-MM-dd");
		Date date = fdm.parse(str);
			User user = new User(0, "hong", "aabb", "hodong", "kanghodong",
												"010-000-0000", "abc@def", date,"",null);
			int result = service.insertUser(user);
			assertThat(result, is(0));
			logger.trace("result : {}", result);
	}
	
	@Test(expected=NicknameDuplicatedException.class)
	@Transactional
	public void insertUserDuplicateByNicknameTest() throws ParseException{
		//아이디 중복 오류 테스트
		String str = "88-12-12";
		SimpleDateFormat fdm = new SimpleDateFormat("yy-MM-dd");
		Date date = fdm.parse(str);
			User user = new User(0, "kang", "aabb", "hhh", "kanghodong",
												"010-000-0000", "abc@def", date,"",null);
			int result = service.insertUser(user);
			assertThat(result, is(0));
			logger.trace("result : {}", result);
	}
	
	
	@Test(expected=IdFailException.class)
	public void searchId() {
		// searchId 테스트
		String str = service.searchId("kildong","eungoo1241@naver.com");
		logger.trace("searchId - hong: {}", str);
	}
	
	@Test
	public void searchPw() {	
		// searchPw 테스트
		String str = service.searchPw("hong","kildong","eungoo1241@naver.com");
		logger.trace("searchPw - hong : {}", str);
	}
	
	@Test
	public void searchPwFail() {	
		// searchPw 테스트
		String str = service.searchPw("hon","kildong","eungoo1241@naver.com");
		logger.trace("searchPw - hong : {}", str);
	}
	
	
	
	
	@Test
	public void deleteUser() {	
		
		int str = service.deleteUser(4);
		logger.trace("deleteUser: {}", str);
	}
	
	@Test
	public void searchUserByUserNoTest(){
		int userNo = 2;
		User user = service.searchUserByUserNo(userNo);
		
		assertThat(user, is(notNullValue()));
	}
	
	@Test
	public void selectUserFriends(){
		int userNo = 108;
		List<User> users = service.selectUserFriends(userNo);
		logger.trace("users :{}",users);
		
	}
	@Test
	public void selectIfYouKnow(){
		int userNo = 162;
		List<User> users = service.selectIfYouKnow(userNo);
		logger.trace("users :{}",users);
		
	}
	@Test
	public void isnt(){
		int userNo = 162;
		int i = ss.insertUserHistory(userNo, 381);
		logger.trace("성공 :{}",i);
		
	}
	
	
	
}
