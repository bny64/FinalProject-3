package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import dto.User;
import service.UserService;

@Controller
public class LoginController {
	static Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	UserService service;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpSession session, @RequestParam String id, @RequestParam String password) {
		logger.trace("class : LoginController, method : login ////// id : {}, password : {}",id, password);
		
		
		User loginUser = service.loginUser(id, password);
		if (loginUser != null) {
			session.setAttribute("id", id);
			model.addAttribute("message", loginUser);
			return "main";
		} else {
			// 민국 - 로그인이 안됬을 시, 로그인 실패에 해당하는 페이지나 알람을 보여줘야 함.
			return "index";
		}
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Model model, User user) {
		logger.trace("class : LoginController, method : join");
			
		return "join";
	}

	@RequestMapping(value = "/searchId", method = RequestMethod.POST)
	public String searchId(Model model, User user) {
		logger.trace("class : LoginController, method : searchId");

		return "searchId";
	}

	@RequestMapping(value = "/searchPw", method = RequestMethod.POST)
	public String searchPw(Model model, User user) {
		logger.trace("class : LoginController, method : searchPw");

		return "searchPw";
	}

}
