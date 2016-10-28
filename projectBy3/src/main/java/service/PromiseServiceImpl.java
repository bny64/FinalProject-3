package service;

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

}
