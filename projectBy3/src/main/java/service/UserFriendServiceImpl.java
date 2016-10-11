package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserFriendDao;
import dto.UserFriend;

@Service
public class UserFriendServiceImpl implements UserFriendService {
	
	static Logger logger = LoggerFactory.getLogger(UserFriendServiceImpl.class);
	
	@Autowired
	UserFriendDao ufDao;
	
	@Override
	public List<UserFriend> friendList(int userNo) {
		logger.trace("UserFriendServiceImpl - friendList() 동작");
		List<UserFriend> friends = ufDao.friendList(userNo);
		return friends;
	}

}
