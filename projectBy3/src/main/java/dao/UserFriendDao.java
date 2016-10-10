package dao;

import java.util.List;

import dto.UserFriend;

public interface UserFriendDao {
	public List<UserFriend> friendList(int userNo);
}
