package service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PromiseDao;
import dto.Promise;

@Service
public class PromiseServiceImpl implements PromiseService {

	static Logger logger = LoggerFactory.getLogger(PromiseServiceImpl.class);
	
	@Autowired
	PromiseDao pDao;
	
	@Override
	public int insertPromise(Promise promise) {
		logger.trace("PromiseServiceImpl - insertPromise 동작");
		int result = pDao.insertPromise(promise);
		return result;
	}

	@Override
	public int updatePromise(Map<String, Object> ProAndDate, Promise promise) {
		logger.trace("PromiseServiceImpl - updatePromise 동작");
		
		int result;
		
		Promise updatePromise = pDao.getPromiseByProAndDate(ProAndDate);
		
		logger.trace("updatePromise : {}", updatePromise);
		
		updatePromise.setPromiseTitle(promise.getPromiseTitle());
		updatePromise.setPromiseDate(promise.getPromiseDate());
		updatePromise.setPromiseLatitude(promise.getPromiseLatitude());
		updatePromise.setPromiseLongitude(promise.getPromiseLongitude());
		updatePromise.setPromiseContent(promise.getPromiseContent());
		updatePromise.setPromiseStatus(promise.getPromiseStatus());
		
		result = pDao.updatePromise(updatePromise);
		
		return result;
	}
}
