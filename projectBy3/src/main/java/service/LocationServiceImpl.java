package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.LocationDao;
import dto.UserLocation;

@Service
public class LocationServiceImpl implements LocationService {

	static Logger logger = LoggerFactory.getLogger(LocationServiceImpl.class);
	
	@Autowired
	LocationDao lDao;
	
	@Override
	public List<UserLocation> userAllLocation(int userNo) {
		logger.trace("LocationServiceImpl - userAllLocation 동작");
		return lDao.userAllLocation(userNo);
	}

}