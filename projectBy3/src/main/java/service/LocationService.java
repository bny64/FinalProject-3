package service;

import java.util.List;

import dto.UserLocation;

public interface LocationService {
	public List<UserLocation> userAllLocation(int userNo);
	public int insertUserLocation(UserLocation userLocation);
	public int deleteUserLocation(int userLocationNo);
	public UserLocation selectOneLocation(String locationName);
}
