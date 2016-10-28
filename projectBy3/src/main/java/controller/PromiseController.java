package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.Promise;
import dto.User;
import dto.UserFriend;
import service.UserFriendService;


@Controller
public class PromiseController {
	static Logger logger = LoggerFactory.getLogger(PromiseController.class);
	
	@Autowired
	UserFriendService userFriendService;
	
	@RequestMapping(value="/promiseBoard")
	public String promise(Model model){
		List<Promise> promises = new ArrayList<>();
		Promise p1=new Promise(1,"서산에서밥먹자11",2,3,new Date(),(float)36.804969,(float)126.435979,"빨리빨리11","약속완료");
		Promise p2=new Promise(1,"보령에서밥먹자22",2,3,new Date(),(float)36.349064,(float)126.594654,"빨리빨리22","약속완료");
		Promise p3=new Promise(1,"전주에서밥먹자33",2,3,new Date(),(float)35.846524,(float)127.134912,"빨리빨리33","약속완료");
		Promise p4=new Promise(1,"부산에서밥먹자44",2,3,new Date(),(float)35.159941,(float)129.049699,"빨리빨리44","약속완료");
		Promise p5=new Promise(1,"울산에서밥먹자55",2,3,new Date(),(float)35.543078,(float)129.245623,"빨리빨리55","약속완료");
		Promise p6=new Promise(1,"경주에서밥먹자66",2,3,new Date(),(float)35.817967,(float)129.246108,"빨리빨리66","약속완료");
		Promise p7=new Promise(1,"목포에서밥먹자77",2,3,new Date(),(float)34.810000,(float)126.394696,"빨리빨리77","약속완료");
		Promise p8=new Promise(1,"제천에서밥먹자88",2,3,new Date(),(float)37.058866,(float)128.143501,"빨리빨리88","약속완료");
		Promise p9=new Promise(1,"평창에서밥먹자99",2,3,new Date(),(float)37.556320,(float)128.486615,"빨리빨리99","약속완료");
		Promise p0=new Promise(1,"속초에서밥먹자00",2,3,new Date(),(float)38.193730,(float)128.544981,"빨리빨리00","약속완료");
		
		
		promises.add(p1);
		promises.add(p2);
		promises.add(p3);
		promises.add(p4);
		promises.add(p5);
		promises.add(p6);
		promises.add(p7);
		promises.add(p8);
		promises.add(p9);
		promises.add(p0);
		
		model.addAttribute("promises", promises);
		logger.trace("약속 잡기 작동:{}",promises);
		return "promiseMainBoard";
	}
	
	@RequestMapping(value="/promise")
	public String promise(Model model,HttpSession session){
		//List<UserFriend> users = userFriendService.friendList((int) session.getAttribute("userNo"));
	//	model.addAttribute("users", users);
		return "promise";
	}
	
	
}
