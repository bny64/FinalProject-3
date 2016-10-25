package com.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/showMessage", method=RequestMethod.GET)
	public String showMessage(Model model){
		
		logger.trace("성공");
		return "showMessage";
	}
	
	@RequestMapping(value="/gidomoon", method=RequestMethod.GET)
	public String gidomoon(Model model){
		logger.trace("기도문으로 이동");
		return "gidomoon";
	}
}
