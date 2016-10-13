package controller;

import java.util.List;

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

import dto.Board;
import dto.Category;
import dto.User;
import dto.UserFriend;
import service.BoardService;
import service.CategoryService;
import service.UserService;

@Controller
public class AdminController {
	static Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	BoardService boardService;
	@Autowired
	UserService userService;
	@Autowired
	CategoryService categoryService;
	
	
	@RequestMapping(value="/admin")
	public String amdin(){
		logger.trace("admin");
		return "adminLogin";
	}
	
	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String adminLogin(Model model, HttpSession session, @RequestParam String id, @RequestParam String password) {
		logger.trace("class : LoginController, method : login ////// id : {}, password : {}",id, password);
		
		/*User loginUser = service.loginUser(id, password);		
		
		if (loginUser != null) {
			session.setAttribute("userNo", loginUser.getUserNo());
			model.addAttribute("message", loginUser);
			return "admin/mainBoard";
		} else {
			// 민국 - 로그인이 안됬을 시, 로그인 실패에 해당하는 페이지나 알람을 보여줘야 함.
			return "index";
		}*/
		
		return "adminMain";
	}
	
	@RequestMapping(value="/adminBoard", method=RequestMethod.GET)
	public String adminBoard(Model model,@RequestParam Integer boardNo,HttpSession session){
		logger.trace("class : MainController, method : adminBoard");		
		logger.trace("boardNo : {}",boardNo);		
		Board board = boardService.selectBoard(boardNo);		
		model.addAttribute("board", board);			
		return "adminBoard";
			
	}
	
	
	
	@RequestMapping(value="/adminDeleteBoard", method=RequestMethod.GET)
	public String adminDeleteBoard(HttpSession session,@RequestParam Integer boardNo){
		int result;
		logger.trace("class : BoardController, method : deleteBoard");	
		result = boardService.deleteBoardByBoardNo(boardNo);
		logger.trace("삭제 결과 : {}", result);
		return "adminMain";
	}
	
	@RequestMapping(value="/returnAdminMainBoard", method=RequestMethod.GET)
	public String returnAdminMainBoard(){		
		return "adminMain";
	}
	
	@RequestMapping("/adminMemberInit")
	public String initMember(){
		return "adminMember2";	
	}
	
	@RequestMapping(value="/adminMember")
	public @ResponseBody List<User> friendList(Model model, HttpSession session,@RequestParam Integer index){
		
		logger.trace("index : {}",index);
		logger.trace("class : FriendController, method : friendList");
		List<User> users = userService.selectAllUserByPaging(index);		
		return users;	
	}
	
	
	
	@RequestMapping(value="/deleteAdminUser")
	public String deleteAdminUser(Model model,@RequestParam Integer userNo){	
		logger.trace("삭제 call:{}",userNo);
		int result = userService.deleteUser(userNo);
		logger.trace("삭제 :{}",result);
		List<User> users = userService.AllUser();
		model.addAttribute("users",users);
		return "adminMember";	
	}
	
	
	
	@RequestMapping(value="/searchMember", method=RequestMethod.GET)
	public @ResponseBody List<User> searchMember(@RequestParam Integer index,@RequestParam String searchStr){
		logger.trace("searchMember");
		List<User> users = userService.searchByNickNameUserNameUsers(index, searchStr);
		return users;
	}
	
	@RequestMapping("/adminCategory")
	public String initCategory(){
		return "adminCategory";	
	}
	
	@RequestMapping(value="/adminCategoryLoad",method=RequestMethod.GET)
	public @ResponseBody List<Category> adminCategoryLoad(Model model, HttpSession session,@RequestParam Integer index){
		
		logger.trace("index : {}",index);
		logger.trace("class : FriendController, method : friendList");
		List<Category> Category = categoryService.selectAllCategoryByPaging(index);
		return Category;	
	}
	
	
	@RequestMapping(value="/searchCategory", method=RequestMethod.GET)
	public @ResponseBody List<Category> searchCategory(@RequestParam Integer index,@RequestParam String searchStr){
		logger.trace("searchCategory");
		List<Category> cate = categoryService.searchByCategoryName(index, searchStr);
		return cate;
	}
	
	@RequestMapping(value="/insertCategory", method=RequestMethod.GET)
	public @ResponseBody List<Category> insertCategory(@RequestParam Integer index,@RequestParam String searchStr){
		logger.trace("insertCategory");
		categoryService.insertCategory(searchStr);
		List<Category> cate = categoryService.selectAllCategoryByPaging(index);
		return cate;
	}
	
	
	
	
	
	
	
}
