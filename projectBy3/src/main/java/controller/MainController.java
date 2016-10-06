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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.Board;
import service.BoardService;
import service.UserService;

@Controller
public class MainController {

	static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	BoardService service;
	@Autowired
	UserService userservice;
	
	// Format 형태로 입력된 문자열을 date로 바꿈
	@InitBinder
	public void setBindingFormat(WebDataBinder binder){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
	}
	
	//1. 게시물 불러오기 a.jax 처리
	//3. 글 검색
	@RequestMapping(value="getAllBoards", method=RequestMethod.GET)
	public @ResponseBody List<Board> getAllBoards(Model model){
		logger.trace("class : MainController, method : getBoards");
		List<Board> boards = service.viewAllBoards();
		return boards;
	}
	
	@RequestMapping(value="/mainBoard", method=RequestMethod.GET)
	public @ResponseBody List<Board> getAllBoards2(Model model,@RequestParam Integer index){
		logger.trace("class : MainController, method : getAllBoards2");
		List<Board> boards = service.selectAllBoardByPaging(index);		
		return boards;
	}
	
	@RequestMapping(value="/selectBoard", method=RequestMethod.GET)
	public @ResponseBody Board getBoard(Model model,@RequestParam Integer userNo){
		logger.trace("class : MainController, method : getBoard");
		Board board = service.selectBoard(userNo);
		
		return board;
	}
	
	@RequestMapping(value="/selectMyBoard", method=RequestMethod.GET)
	public @ResponseBody List<Board> selectMyBoard(Model model,HttpSession session,@RequestParam Integer index){
		logger.trace("class : MainController, method : selectMyBoard");
		int userNo =  (int) session.getAttribute("userNo");				
		List<Board> boards = service.selectMyBoardByPaging(userNo,index);		
		//List<Board> boards = service.selectMyBoard(userNo);
		return boards;
	}
	
	
	@RequestMapping(value="/detailBoard", method=RequestMethod.GET)
	public String detailBoard(Model model,@RequestParam Integer boardNo,HttpSession session){
		logger.trace("class : MainController, method : detailBoard");		
		logger.trace("boardNo : {}",boardNo);		
		Board board = service.selectBoard(boardNo);
		int userNo =  (int) session.getAttribute("userNo");
		logger.trace("boardNo : {}",boardNo);
		logger.trace("userNo : {}",userNo);
		logger.trace("Board userNo : {}",board.getUserNo());
		session.setAttribute("myBoard", board);
		model.addAttribute("board", board);
		if(userNo == board.getUserNo()){
			logger.trace("detailMyBoard 콜");
			return "detailMyBoard";
		}else{
			logger.trace("detailBoard 콜");
			return "detailBoard";
		}	
		
	}
	
	
}
