package dao;

import java.util.List;

import dto.UserCategory;

public interface UserCategoryDao {
	public List<UserCategory> selectAllUserCategory();	
	public List<UserCategory> selectUserCategory(int userNo);
}
