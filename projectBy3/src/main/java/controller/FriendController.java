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

import dto.UserFriend;
import service.UserFriendService;

@Controller
public class FriendController {
	
	static Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	UserFriendService service;
	
	@RequestMapping(value="/friendList", method=RequestMethod.GET)
	public String friendList(Model model, HttpSession session){
		logger.trace("class : FriendController, method : friendList");
		int userNo = (int) session.getAttribute("userNo");
		List<UserFriend> friends = service.friendList(userNo);
		model.addAttribute("friends", friends);
		return "friendList";
	}
}
