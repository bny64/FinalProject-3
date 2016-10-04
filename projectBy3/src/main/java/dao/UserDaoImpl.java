package dao;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.User;

@Repository
public class UserDaoImpl implements UserDao {
	private final String NAME_SPACE = "UserMapper.";

	static Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	@Autowired
	private SqlSessionTemplate template;

	@Override
	//사용자 전체를 검색하는 메서드
	public List<User> selectAllUser() {
		logger.trace("UserDaoImpl - selectAllUser 동작");
		String stmt = NAME_SPACE + "selectAllUser";
		return template.selectList(stmt);
	}
	
	@Override
	// 사용자 한명을 검색하는 메서드(로그인 서비스에 사용)
	public User selectUser(String userId) {
		logger.trace("UserDaoImpl - selectUser 동작");
		String stmt = NAME_SPACE + "selectUser";
		return template.selectOne(stmt, userId);
	}

	@Override
	public int insertUser(User user) {
		//사용자 한명을 등록하는 메서드(회원가입 서비스에 사용)
		logger.trace("UserDaoImpl - insertUser 동작");
		String stmt = NAME_SPACE + "insertUser";
		return template.update(stmt, user);
	}
}
