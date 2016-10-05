package controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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

	// 민국 : 필수 입력 사항 설정 --> 해당 항목의 값이 없을 경우 오류 발생
	@InitBinder
	public void setEssentialFields(WebDataBinder binder){
		binder.setRequiredFields("userId", "password", "nickname", "userName");
	}
	
	// 민국 : Format형태로 입력 된 문자열을 date로 바꿈
	@InitBinder
	public void setBindingFormat(WebDataBinder binder){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpSession session, @RequestParam String id, @RequestParam String password) {
		logger.trace("class : LoginController, method : login ////// id : {}, password : {}",id, password);
		
		User loginUser = service.loginUser(id, password);
		if (loginUser != null) {
			session.setAttribute("id", id);
			model.addAttribute("message", loginUser);
			return "mainBoard";
		} else {
			// 민국 - 로그인이 안됬을 시, 로그인 실패에 해당하는 페이지나 알람을 보여줘야 함.
			return "index";
		}
	}

	@RequestMapping(value = "/joinPage", method = RequestMethod.GET)
	public String joinPage(Model model) {
		logger.trace("class : LoginController, method : joinPage");
		model.addAttribute("user", new User(1,"","","","","","",new Date()));
		return "join";
	}
	
	@RequestMapping(value = "/joinPage", method = RequestMethod.POST)
	public String join(Model model, User user, BindingResult result) {
		logger.trace("class : LoginController, method : join, userInfo : {}", user);
		
		if(user != null){
			service.insertUser(user);
			return "main";
		}
		// 민국 - 유저가 null 일 경우..
		return "index";
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
