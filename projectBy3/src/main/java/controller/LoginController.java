package controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.User;
import service.Service;
import service.ServiceImpl;

@Controller
public class LoginController {
	static Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	Service service;
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(Model model,User user,HttpSession session){
		logger.trace("class : LoginController, method : login");
		User loginusers=service.loginUser(user.getUserId(), user.getPassword());
		if(loginusers!=null){
			session.setAttribute("id", user.getUserId());
			
			//Test
			model.addAttribute("message",user);return "showMessage";
			
			//return "mainBoard";
		}else{
			return "";			
		}		
	}
	
	@RequestMapping(value="/joinPage",method = RequestMethod.POST)
	public String join(Model model,User user){
		logger.trace("class : LoginController, method : join");		
		/*int result = service.join(user);
		if(result == 1){
			return "index";
		}else{
			return "joinFail";
		}*/
		
		
		return "";
	}
	
	@RequestMapping(value="/serchId",method = RequestMethod.POST)
	public String serchId(Model model,User user){
		logger.trace("class : LoginController, method : serchId");		
		/*int result = service.join(user);
		if(result == 1){
			return "index";
		}else{
			return "joinFail";
		}	*/
		
		return "";
	}
	
	@RequestMapping(value="/serchPw",method = RequestMethod.POST)
	public String serchPw(Model model,User user){
		/*logger.trace("class : LoginController, method : serchPw");		
		int result = service.join(user);
		if(result == 1){
			return "index";
		}else{
			return "joinFail";
		}*/			
		
		return "";
	}
	
	
	
	
}
