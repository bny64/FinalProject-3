package controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import dto.Board;
import dto.Category;
import service.BoardService;
import service.CategoryService;
import service.UserService;

@Controller
@SessionAttributes({"MyBoard"})
public class BoardController {

	static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	@Autowired
	CategoryService ctservice;
	@Autowired 
	UserService userService;

	
	@InitBinder
	public void setBindingFormat(WebDataBinder binder){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
	}
	
	@RequestMapping(value="/deleteBoard", method=RequestMethod.GET)
	public String deleteBoard(HttpSession session){
		int result;
		logger.trace("class : BoardController, method : deleteBoard");
		Board board = (Board) session.getAttribute("myBoard");
		logger.trace("myBoard : {}", board);
		result = service.deleteBoardByBoardNo(board.getBoardNo());
		logger.trace("삭제 결과 : {}", result);
		return "mainBoard";
	}
	
	@RequestMapping(value="/writeBoard", method=RequestMethod.GET)
	public String writeBoard(Model model, HttpSession session){
		logger.trace("class : BoardController, method : writeBoard");
		
		List<Category> category = ctservice.selectAllCategory();
		model.addAttribute("category", category);
		
		int userNo = (int) session.getAttribute("userNo");
		logger.trace("userNo : {}", userNo);
		
		Board board = new Board(0,"",0,"",null,userNo,0,"",null);
		model.addAttribute("board", board);
		
		return "writeBoard";
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
	
	
	private static final String uploadDir = "c:/Users/1-718-8/git/FinalProject-3/projectBy3/src/main/webapp/WEB-INF/assets/images/userImages/";	
	@RequestMapping(value="/writeBoard", method=RequestMethod.POST)
	public String writeBoardPost(HttpSession session, Board board, @RequestParam MultipartFile file) throws IllegalStateException, IOException{
		logger.trace("class : BoardController, method : writeBoardPost");	
		logger.trace("board : {}", board);
		int userNo = (int)session.getAttribute("userNo");
		
		File uploadFile = new File ( uploadDir + userNo +"." +System.currentTimeMillis()+file.getOriginalFilename());
		file.transferTo(uploadFile);	
		
		board.setImagePath(file.getOriginalFilename());
		
		//쓰기 버튼을 누르고 글 작성 시간 추가
		board.setWritedDate(new Date());
		
		int result = service.insertBoard(board);
		logger.trace("글쓰기 결과 : {}", result);
		
		
		return "mainBoard";
	}
	@RequestMapping(value="/getMyLocation", method=RequestMethod.GET)
	public String getMyLocation(HttpSession session, Board board){
		return "writeLocation";
	}
	
	
	@RequestMapping(value="/returnMainBoard", method=RequestMethod.GET)
	public String returnMainBoard(HttpSession session, Board board){
		return "mainBoard";
	}
}




















