package controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AndroidTestController {

	static Logger logger = LoggerFactory.getLogger(AndroidTestController.class);
	
	@RequestMapping("/android")
	public void androidTest(){
		logger.trace("안드로이드 접근 성공");
	}
	
	@RequestMapping("/android2")
	public void androidTest2(HttpServletRequest request){
		logger.trace("위도 : {}", request.getParameter("latitude"));
		logger.trace("경도 : {}", request.getParameter("longitude"));
	}
}
