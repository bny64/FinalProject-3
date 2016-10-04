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

	/*@RequestMapping(value = "/login")
	public String index(Model model) {		
		User user =null;
		
		model.addAttribute("user",user);
		return "index";
	}*/

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, User user, HttpSession session, @RequestParam String id) {
		logger.trace("{}",id);
		
		
		logger.trace("class : LoginController, method : login");
		
		
		User loginusers = service.loginUser(user.getUserId(), user.getPassword());
		if (loginusers != null) {
			session.setAttribute("id", user.getUserId());

			// Test
			model.addAttribute("message", user);
			return "showMessage";

			// return "mainBoard";
		} else {
			return "";
		}
	}

	@RequestMapping(value = "/joinPage", method = RequestMethod.POST)
	public String join(Model model, User user) {
		logger.trace("class : LoginController, method : join");
		/*
		 * int result = service.join(user); if(result == 1){ return "index";
		 * }else{ return "joinFail"; }
		 */

		return "";
	}

	@RequestMapping(value = "/serchId", method = RequestMethod.POST)
	public String searchId(Model model, User user) {
		logger.trace("class : LoginController, method : searchId");
		/*
		 * int result = service.join(user); if(result == 1){ return "index";
		 * }else{ return "joinFail"; }
		 */

		return "";
	}

	@RequestMapping(value = "/serchPw", method = RequestMethod.POST)
	public String searchPw(Model model, User user) {
		/*
		 * logger.trace("class : LoginController, method : searchPw"); int result
		 * = service.join(user); if(result == 1){ return "index"; }else{ return
		 * "joinFail"; }
		 */

		return "";
	}

}
