package dao;

import dto.User;

public interface UserDao {
	public User selectUser(String userId);
}
