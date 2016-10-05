package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.Board;
import service.UserService;

@Controller
public class MainController {

	static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	UserService service;
	
	// Format 형태로 입력된 문자열을 date로 바꿈
	@InitBinder
	public void setBindingFormat(WebDataBinder binder){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
	}
	
	//1. 게시물 불러오기 a.jax 처리
	//3. 글 검색
	@RequestMapping(value="", method=RequestMethod.GET)
	public @ResponseBody List<Board> getBoards(Model model){
		logger.trace("class : LoginController, method : getBoards");
		//List<Board> boards = service.getBoards();
		//model.addAttribute("boards", boards);
		return null;
	}
	
}
