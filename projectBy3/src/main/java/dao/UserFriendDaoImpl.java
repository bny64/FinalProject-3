package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.UserFriend;

@Repository
public class UserFriendDaoImpl implements UserFriendDao {

	static Logger logger = LoggerFactory.getLogger(UserFriendDaoImpl.class);
	
	final static String USERFRIEND_NS = "UserFriendMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<UserFriend> friendList(int userNo) {
		logger.trace("UserFriendDaoImpl - friendList 동작");
		String stmt = USERFRIEND_NS + "friendList";
		return template.selectList(stmt, userNo);
	}

	@Override
	public int updateAlarm(Map<String, Object> friend) {
		logger.trace("UserFriendDaoImpl - updateAlarm 동작");
		String stmt = USERFRIEND_NS + "updateAlarm";
		return template.update(stmt, friend);
	}

	@Override
	public String selectAlarm(Map<String, Object> filter) {
		logger.trace("UserFriendDaoImpl - selectAlarm 동작");
		String stmt = USERFRIEND_NS + "selectAlarm";
		return template.selectOne(stmt, filter);
	}

	@Override
	public int deleteFriend(int friendNo) {
		logger.trace("UserFriendDaoImpl - deleteFriend 동작");
		String stmt = USERFRIEND_NS + "deleteFriend";
		return template.delete(stmt, friendNo);
	}

	@Override
	public int insertFriend(UserFriend userFriend) {
		logger.trace("UserFriendDaoImpl - insertFriend 동작");
		String stmt = USERFRIEND_NS + "insertFriend";
		return template.insert(stmt, userFriend);
	}


}
