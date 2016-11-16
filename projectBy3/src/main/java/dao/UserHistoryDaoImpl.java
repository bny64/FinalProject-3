package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.UserHistory;
@Repository
public class UserHistoryDaoImpl implements UserHistoryDao {
	private final String NAME_SPACE = "UserHistoryMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	@Override
	public int insertUserHistory(UserHistory userHistory) {
		String stmt = NAME_SPACE + "selectAllUser";
		return template.insert(stmt,userHistory);
	}

}
