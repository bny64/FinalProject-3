package service;

import java.util.List;

import dto.User;

public interface UserService {
	public User loginUser(String id, String password);
	public List<User> AllUser();
	public int insertUser(User user);
	public String searchId(String name,String email);
	public String searchPw(String id,String name,String email);
	public int deleteUser(int userNo);
	public List<User> sselectAllUserByPaging(int pageNo);
	public User searchByNickname(String nickname);

}
