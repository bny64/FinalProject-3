package com.example.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import config.ApplicationConfig;
import dao.UserCategoryDao;
import dto.Category;
import dto.UserCategory;
import service.CategoryService;
import service.UserCategoryService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
public class UserCategoryServiceTest {
	static Logger logger = LoggerFactory.getLogger(UserCategoryServiceTest.class);
	
	@Autowired
	UserCategoryService service;
	
	@Autowired
	UserCategoryDao dao;
	@Autowired
	CategoryService categoryService;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		List<UserCategory> ct = service.selectAllUserCategory();
		logger.trace("ct :{}",ct);
	}
	
	@Test
	public void selectUserCategoryDaoTest(){
		List<UserCategory> userCategorys = dao.selectUserCategory(108);
		logger.trace("userCategorys : {}", userCategorys);
	}
	@Test
	public void selectUserCategoryServiceTest(){
		List<UserCategory> userCategorys = service.selectUserCategory(108);
		logger.trace("selectUserCategoryServiceTest userCategorys : {}", userCategorys);
	}
	
	
	@Test
	public void insertUserCategory(){	
		UserCategory userCategory = new UserCategory();
		userCategory.setUserNo(108);
		userCategory.setCategoryNo(1);
		int result = service.insertUserCategory(userCategory);
		logger.trace("결과 : {}", result);
	}
	@Test
	public void deleteUserCategory(){
		int result = service.deleteUserCategory(4,108);
		logger.trace("결과 : {}", result);
	}
	
	@Test
	public void selectUserCategoryServiceTest2(){
		List<UserCategory> userCategorys = service.selectUserCategory(108);
		
		List<Category> category = categoryService.selectAllCategory();		
		
		
		for(int i = 0 ; i<category.size();i++){				
			logger.trace("카테고리:{}",category.get(i).getCategoryNo());
			for(int j = 0; j < userCategorys.size();j++){
				if(category.get(i).getCategoryNo()==userCategorys.get(j).getCategoryNo()){
					category.remove(i);
					logger.trace("제거 :{}",userCategorys.get(j).getCategory().getCategoryName());
				}
				
			}			
		}
		
		
		
		for(int i=0 ; i < category.size();i++){
			logger.trace("중복 제거 카테고리:{}",category.get(i).getCategoryName());
		}
		
		
		
		
		logger.trace("selectUserCategoryServiceTest userCategorys : {}", userCategorys.size());
	}
	
	

}
