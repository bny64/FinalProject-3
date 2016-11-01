package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.google.gson.Gson;

import dto.Board;
import service.BoardLoactionService;
import service.UserService;

@Controller
public class AndroidControllerM {

	static Logger logger = LoggerFactory.getLogger(AndroidControllerM.class);

	@Autowired
	BoardLoactionService bLService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/android")
	public void androidTest(){
		logger.trace("안드로이드 접근 성공"); 
	}
	
	@RequestMapping(value="/android2/{Jlocation:.+}", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<Map<String, Object>> androidTest2(@PathVariable("Jlocation") String Jlocation){
		logger.trace("Jlocation : {}", Jlocation);
		Gson gson = new Gson();
		
		// 민국 - 안드로이드에서 넘겨받은 위도,경도,userNo 값.
		Map<String, Object> androidInfo = gson.fromJson(Jlocation, Map.class);
		float centerLat = (float)((double) androidInfo.get("latitude"));
		float centerLng = (float)((double)androidInfo.get("longitude"));
		int userNo = (int) ((double)androidInfo.get("userNo"));
		float range = (float) 0.0050; // 탐색 범위
		
		logger.trace("location : latitude : {}, longitude : {}, userNo : {}", centerLat, centerLng, userNo);
		
		// 민국 - 주변 친구들 글을 조회하기 위한 세팅
		Map<String,Object> filter = new HashMap<>();
		
		filter.put("centerLat", centerLat);
		filter.put("centerLng", centerLng);
		filter.put("range", range);
		filter.put("userNo", userNo);
		
		List<Board> boards = bLService.getBoardsBycenterLocation(filter);
		
		if(boards.isEmpty()){
			logger.trace("발견 된 글 없음.");
		
			return null;
		} else{
			logger.trace("글 발견 boards : {}", boards);
			
			// 민국 - 밑에부터는 알람에 보여줄 정보를 담음. *메시지에 대해서 상담 필요.
			//이 컨트롤에서 해당 알림에 대한 게시물의 정보를 리턴해줘야 함.
			List<Map<String, Object>> androidResponse = new ArrayList<Map<String, Object>>();
			for(Board board : boards){
				Map<String, Object> messages = new HashMap<String, Object>();
				messages.put("boardNo", board.getBoardNo());
				messages.put("title", board.getTitle());
				messages.put("userName", userService.searchUserByUserNo(userNo).getUserName());
				androidResponse.add(messages);
			}
			logger.trace("androidResponse messages : {}", androidResponse);
			//위도, 경도를 넘겨주고 필요한 내용을 List<Map<String, Object>>에 담아 리턴. *boardNo는 필수
			return androidResponse;
		}
	}
	
	@RequestMapping(value="/getAroundBoards", method=RequestMethod.GET)
	public @ResponseBody List<Board> getAroundBoards(Model model, HttpSession session, @RequestParam Float centerLat, @RequestParam Float centerLng){
		logger.trace("class : BoardLocationController, method : getAroundBoards");
		Map<String,Object> filter = new HashMap<>();
		
		//float centerLat = (float) 36.81506854521463;
		//float centerLng = (float) 127.11321711527751;
		float range = (float) 0.0050;
		// 민국 - 세션이 아직 없어서 주석
		//int userNo = (int) session.getAttribute("userNo");
		int userNo = 1;
		
		filter.put("centerLat", centerLat);
		filter.put("centerLng", centerLng);
		filter.put("range", range);
		filter.put("userNo", userNo);
		
		List<Board> myAroundBoards = bLService.getBoardsBycenterLocation(filter);
	
		model.addAttribute("myAroundBoards", myAroundBoards);
		// 임시
		return myAroundBoards;
	}
	
	
}
