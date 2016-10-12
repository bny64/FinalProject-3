package controller;

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
//		logger.trace("alarm : {}", friends.get(0).getAlarm());
		return "friendList";
	}
	
	@RequestMapping(value="/updateAlarm", method=RequestMethod.POST)
	public @ResponseBody String updateAlarm(@RequestParam String alarm, 
																		  @RequestParam int friendNo){
		int result;
		logger.trace("class : FriendController, method : updateAlarm");
		logger.trace("alarm : {}",service.selectAlarm(friendNo));
		logger.trace("friendNo : {}", friendNo);
		Map<String, Object> friend = new HashMap<>();
		friend.put("alarm", alarm);
		friend.put("friendNo", friendNo);
		result = service.updateAlarm(friend);
		logger.trace("alarm : {}", service.selectAlarm(friendNo));
		return service.selectAlarm(friendNo);
	}
	
	@RequestMapping(value="/deleteFriend", method=RequestMethod.GET)
	public String deleteFriend(HttpSession session, Model model, @RequestParam int friendNo){
		logger.trace("class : FriendController, method : deleteFriend");
		service.deleteFriend(friendNo);
		int userNo = (int) session.getAttribute("userNo");
		List<UserFriend> friends = service.friendList(userNo);
		model.addAttribute("friends", friends);
		return "friendList";
	}
}
