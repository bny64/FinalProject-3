package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.UserLocation;

@Repository
public class LocationDaoImpl implements LocationDao {

	static Logger logger = LoggerFactory.getLogger(LocationDaoImpl.class);
	
	final static String  LOCATION_NS = "UserLocationMapper.";

	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<UserLocation> userAllLocation(int userNo) {
		logger.trace("LocationDaoImpl - userAllLocation 동작");
		String stmt = LOCATION_NS + "selectUserLocation";
		return template.selectList(stmt, userNo);
	}

}
