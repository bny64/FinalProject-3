package service;

import java.util.List;
import java.util.Map;

import dto.User;
import dto.UserFriend;

public interface UserFriendService {
	public List<UserFriend> friendList(int userNo);
	public int updateAlarm(Map<String, Object> friend);
	public String selectAlarm(int friendNo);
	public int deleteFriend(int friendNo);
	public User searchUserbyNickname(String nickname);
	public int insertFriend(int friendNo, int userNo);
}
