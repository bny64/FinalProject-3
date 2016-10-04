package dao;

import java.util.List;
import java.util.Map;

import dto.User;

public interface UserDao {
	public List<User> selectAllUser();
	public User selectUser(String userId);
	public User selectUserByNickname(String nickname);
	public int insertUser(User user);
	public User searchId(String id);
	public User searchPw(Map<String,Object> info);
}
