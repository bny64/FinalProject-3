package dao;

import java.util.List;

import dto.UserCategory;

public interface UserCategoryDao {
	public List<UserCategory> selectAllUserCategory();
}
