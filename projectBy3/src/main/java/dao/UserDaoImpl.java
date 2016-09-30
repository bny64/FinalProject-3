package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.User;

@Repository
public class UserDaoImpl implements UserDao {
	private final String NAME_SPACE = "UserMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	//사용자 한명을 검색
	public User selectUser(String userId) {
		String stmt = NAME_SPACE + "selectUser";
		return template.selectOne(stmt, userId);
	}

}
