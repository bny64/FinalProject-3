package dao;

import java.util.List;

import dto.UserLocation;

public interface LocationDao {
	public List<UserLocation> userAllLocation(int userNo);
	public int insertUserLocation(UserLocation userLocation);
	public int deleteUserLocation(int userLocationNo);
	public UserLocation userLocationOne(String LocationName);
}
