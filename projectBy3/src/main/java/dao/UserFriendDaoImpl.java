package dao;

import java.util.List;

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

}
