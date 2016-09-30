package service;

import dto.User;

public interface Service {
	public User loginUser(String id, String password);
}
