package service;

import java.util.List;

import dto.User;

public interface UserService {
	public User loginUser(String id, String password);
	public List<User> AllUser();
	public int insertUser(User user);
}
