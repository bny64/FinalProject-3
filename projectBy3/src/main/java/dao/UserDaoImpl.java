package dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
	// 사용자 한명을 검색하는 메서드(로그인 서비스, 회원가입 아이디 중복확인에 사용)
	public User selectUser(String userId) {
		logger.trace("UserDaoImpl - selectUser 동작");
		String stmt = NAME_SPACE + "selectUser";
		return template.selectOne(stmt, userId);
	}
	
	@Override
	//사용자 한명을 닉네임으로 검색하는 메서드(회원가입 닉네임 중복확인에 사용)
	public User selectUserByNickname(String nickname) {
		logger.trace("UserDaoImpl - selectUserByNickname 동작");
		String stmt = NAME_SPACE + "selectUserByNickname";
		return template.selectOne(stmt, nickname);
	}

	@Override
	public int insertUser(User user) {
		//사용자 한명을 등록하는 메서드(회원가입 서비스에 사용)
		logger.trace("UserDaoImpl - insertUser 동작");
		String stmt = NAME_SPACE + "insertUser";
		return template.update(stmt, user);
	}

	@Override
	public User searchId(Map<String,Object> info) {
		// 사용자의 아이디를 찾기위한 메서드(이름으로 id 찾기)
		logger.trace("UserDaoImpl - searchId 동작");
		String stmt = NAME_SPACE + "searchId";
		return template.selectOne(stmt,info);
	}

	@Override
	public User searchPw(Map<String,Object> info) {

		// 사용자의 비밀번호를 찾기위한 메서드(이름으로 id 찾기)
		logger.trace("UserDaoImpl - searchPw 동작");
		String stmt = NAME_SPACE + "searchPw";
		return template.selectOne(stmt,info);
	}

	@Override
	public int deleteUser(int userNo) {
		logger.trace("");
		String stmt = NAME_SPACE + "deleteUser";		
		return template.delete(stmt,userNo);
	}

	@Override
	public List<User> sselectAllUserByPaging(Map<String, Object> filter) {
		logger.trace("sselectAllUserByPaging");
		String stmt = NAME_SPACE +"sselectAllUserByPaging";
		return template.selectList(stmt,filter);
	}
}
