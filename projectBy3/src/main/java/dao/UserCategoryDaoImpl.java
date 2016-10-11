package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Category;
import dto.UserCategory;

@Repository
public class UserCategoryDaoImpl implements UserCategoryDao{
	static Logger logger = LoggerFactory.getLogger(UserCategoryDaoImpl.class);
	final static String BOARD_NS = "UserCategoryMapper.";
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<UserCategory> selectAllUserCategory() {
		logger.trace("UserCategoryDaoImpl - selectAllUserCategory 동작");
		String stmt = BOARD_NS + "selectAllUserCategory";
		return template.selectList(stmt);
	}

	@Override
	public Map<String, Object> getUserCategory() {
		logger.trace("UserCategoryDaoImpl - selectAllUserCategory 동작");
		String stmt = BOARD_NS + "selectUserCategory";
		return null;
	}

	@Override
	public List<UserCategory> selectUserCategory(int userNo) {
		logger.trace("UserCategoryDaoImpl - selectUserCategory 동작");
		String stmt = BOARD_NS + "selectUserCategory";
		return template.selectList(stmt, userNo);
	}	
	
	


	

}
