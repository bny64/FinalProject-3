package dao;

import java.util.List;

import dto.User;

public interface UserDao {
	public List<User> selectAllUser();
	public User selectUser(String userId);
	public int insertUser(User user);
}
