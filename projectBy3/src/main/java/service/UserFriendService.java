package service;

import java.util.List;

import dto.UserFriend;

public interface UserFriendService {
	public List<UserFriend> friendList(int userNo);
}
