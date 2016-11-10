package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.Category;
import dto.User;
import dto.UserCategory;
import dto.UserFriend;
import service.CategoryService;
import service.UserCategoryService;
import service.UserFriendService;
import service.UserService;

@Controller
public class CategoryController {
	
	static Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	UserFriendService service;
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserCategoryService userCategoryService;
	
	@Autowired
	CategoryService categoryService;
	
	
	@RequestMapping(value="/initSearchUserCategory", method=RequestMethod.GET)
	public String initSearchFriend(Model model, HttpSession session){
		logger.trace("class : FriendController, method : initSearchFriend");
		
		List<Category> category = categoryService.selectAllCategory();
		model.addAttribute("category", category);
		
		return "searchCategory2";
	}
	
	@RequestMapping(value="/searchCategory", method=RequestMethod.POST)
	public String searchCategory(Model model, HttpSession session, @RequestParam String categoryName){
		logger.trace("class : FriendController, method : searchCategory");
		
		if(categoryName != null){
			
			List<Category> category = categoryService.searchByCategoryName(1, categoryName);	
			
			model.addAttribute("category", category);
			
			
		}
		
		return "searchCategory2";
	}
	
	@RequestMapping(value="/insertUserCategory", method=RequestMethod.GET)
	public String insertUserCategory(HttpSession session, Model model, @RequestParam int userNo){
		logger.trace("class : FriendController, method : insertUserCategory");
		
		// jsp에서 가져온 userNo -> friendNo
		int categoryNo = userNo;
		
		// insert를 요청한 userNo
		int myUserNo = (int) session.getAttribute("userNo");		
	
		UserCategory userCategory = new UserCategory();
		userCategory.setCategoryNo(categoryNo);
		userCategory.setUserNo(myUserNo);
		userCategoryService.insertUserCategory(userCategory);
		
		List<UserCategory> category = userCategoryService.selectUserCategory(myUserNo);
		model.addAttribute("categories", category);
		
		return "category2";
	
	}
	
	
	
}
