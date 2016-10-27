package controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//location으로 board들을 관리할 컨트롤러
 
@Controller
public class LocationBoardController {
	static Logger logger = LoggerFactory.getLogger(LocationBoardController.class);
	
	@RequestMapping(value="/getAroundBoards")
	public String getAroundBoards(Model model, HttpSession session){
		float centerLat = (float) 36.81506854521463;
		float centerLng = (float) 127.11321711527751;
		
		return null;
	}
}
