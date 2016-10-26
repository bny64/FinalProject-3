package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.Gson;

@Controller
public class AndroidTestController {

	static Logger logger = LoggerFactory.getLogger(AndroidTestController.class);
	
	@RequestMapping("/android")
	public void androidTest(){
		logger.trace("안드로이드 접근 성공"); 
	}
	
	@RequestMapping(value="/android2/{Jlocation:.+}", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<Map<String, Object>> androidTest2(@PathVariable("Jlocation") String Jlocation){
		logger.trace("Jlocation : {}", Jlocation);
		Gson gson = new Gson();
		Map<String, Object> map = gson.fromJson(Jlocation, Map.class);
		double latitude = (double) map.get("latitude");
		double longitude = (double)map.get("longitude");
		logger.trace("location : latitude : {}, longitude : {}", latitude, longitude);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("boardNo", 2);
		map2.put("User", "홍길동");
		list.add(map2);
		//위도, 경도를 넘겨주고 필요한 내용을 List<Map<String, Object>>에 담아 리턴. *boardNo는 필수
		return list;
	}
}
