package dao;

import java.util.List;
import java.util.Map;

import dto.Category;
import dto.UserCategory;

public interface UserCategoryDao {
	public List<UserCategory> selectAllUserCategory();
	Map<String,Object> getUserCategory();
	public List<UserCategory> selectUserCategory(int userNo);
}
