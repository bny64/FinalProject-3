package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
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
import service.BoardService;

@Controller
@SessionAttributes({"myBoard"})
public class BoardController {

	static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	
	@InitBinder
	public void setBindingFormat(WebDataBinder binder){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
	}
	/*@RequestMapping(value="/updateBoard", method=RequestMethod.POST)
	public String updateBoard(HttpSession session, )*/
	
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
	
	@RequestMapping(value="/updateBoard", method=RequestMethod.POST)
	public String updateBoard(HttpSession session, Board board){
		logger.trace("class : BoardController, method : deleteBoard");
		String ImagePath = board.getImagePath();
		
		logger.trace("board : {}", board);
		
		
		// 이미지가 문자열 null이 아니고 주소가 null일떄 예외 처리.
		logger.trace("myBoard imagePath : {}", ImagePath);
		if(ImagePath == null ){
			logger.trace("ImagePath null!!!!!!!!!");
			board.setImagePath("null");
		}
		int result = service.updateBoard(board); 
		logger.trace("수정 결과 : {}", result);
		return "mainBoard";
	}
	
}
