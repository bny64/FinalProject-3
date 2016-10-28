package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PromiseController {
	static Logger logger = LoggerFactory.getLogger(PromiseController.class);
	
	
	@RequestMapping(value="/promiseBoard")
	public String promise(){
		return "promiseMainBoard";
	}
	
}
