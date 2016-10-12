package service;

import java.util.List;
import java.util.Map;

import dto.UserFriend;

public interface UserFriendService {
	public List<UserFriend> friendList(int userNo);
	public int updateAlarm(Map<String, Object> friend);
	public String selectAlarm(int friendNo);
	public int deleteFriend(int friendNo);
}