package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserInfoController {

	@RequestMapping(value = "/updateUser", method=RequestMethod.GET)
	public String updateUser(Model model) {
		model.addAttribute("message","hello");
		return "showMessage";
	}

	
	
	
	
public String template(Model model){
			
		return "showMessage";
	}
}
