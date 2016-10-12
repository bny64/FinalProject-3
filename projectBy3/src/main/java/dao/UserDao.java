package dao;

import java.util.List;
import java.util.Map;

import dto.User;

public interface UserDao {
	public List<User> selectAllUser();
	public User selectUser(String userId);
	public User selectUserByNickname(String nickname);
	public int insertUser(User user);
	public User searchId(Map<String,Object> info);
	public User searchPw(Map<String,Object> info);
	public int deleteUser(int userNo);
	public List<User> sselectAllUserByPaging(Map<String, Object> filter);
}
