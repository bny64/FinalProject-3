package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import dto.Board;
import dto.Category;
import service.BoardService;
import service.CategoryService;

@Controller
@SessionAttributes({"MyBoard"})
public class BoardController {

	static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	@Autowired
	CategoryService ctservice;
	
	@InitBinder
	public void setBindingFormat(WebDataBinder binder){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
	}
	
	@RequestMapping(value="/deleteBoard", method=RequestMethod.POST)
	public String deleteBoard(HttpSession session){
		int result;
		logger.trace("class : BoardController, method : deleteBoard");
		Board board = (Board) session.getAttribute("myBoard");
		logger.trace("myBoard : {}", board);
		result = service.deleteBoardByBoardNo(board.getBoardNo());
		logger.trace("삭제 결과 : {}", result);
		return "mainBoard";
	}
	
	@RequestMapping(value="/writeBoard")
	public String insertBoard(Model model){
		List<Category> category = ctservice.selectAllCategory();
		model.addAttribute("category", category);
		return "writeBoard";
	}
	
	
	
	
	
	
	
}
