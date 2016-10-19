package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AndroidTestController {

	static Logger logger = LoggerFactory.getLogger(AndroidTestController.class);
	
	@RequestMapping("android")
	public void androidTest(){
		logger.trace("안드로이드 접근 성공");
	}
}
