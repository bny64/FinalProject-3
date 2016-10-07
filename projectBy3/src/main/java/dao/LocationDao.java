package dao;

import java.util.List;

import dto.UserLocation;

public interface LocationDao {
	public List<UserLocation> userAllLocation(int userNo);
}
