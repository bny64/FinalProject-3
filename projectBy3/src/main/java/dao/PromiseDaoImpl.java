package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Promise;

@Repository
public class PromiseDaoImpl implements PromiseDao{

	static Logger logger = LoggerFactory.getLogger(PromiseDaoImpl.class);
	
	final static String PROMISE_NS = "PromiseMapper.";
	
	@Autowired
	SqlSessionTemplate template;
	
	@Override
	public List<Promise> getAllPromise() {
		logger.trace("PromiseDaoImpl - getAllPromise 동작");
		String stmt = PROMISE_NS + "getAllPromise";
		return template.selectList(stmt);
	}

	@Override
	public List<Promise> getMyPromiseByPromote(int userNo) {
		logger.trace("PromiseDaoImpl - getMyPromiseByPromote 동작");
		String stmt = PROMISE_NS + "getMyPromiseByPromote";
		return template.selectList(stmt, userNo);
	}

	@Override
	public List<Promise> getMyPromiseByInvitee(int userNo) {
		logger.trace("PromiseDaoImpl - getMyPromiseByInvitee 동작");
		String stmt = PROMISE_NS + "getMyPromiseByInvitee";
		return template.selectList(stmt, userNo);
	}

	@Override
	public int insertPromise(Promise promise) {
		logger.trace("PromiseDaoImpl - insertPromise 동작");
		String stmt = PROMISE_NS + "insertPromise";
		return template.update(stmt, promise);
	}

	@Override
	public Promise getPromiseByProAndDate(Map<String, Object> ProAndDate) {
		logger.trace("PromiseDaoImpl - getPromiseByProAndDate 동작");
		String stmt = PROMISE_NS + "getPromiseByProAndDate";
		return template.selectOne(stmt, ProAndDate);
	}
	
	@Override
	public int updatePromise(Promise promise) {
		logger.trace("PromiseDaoImpl - updatePromise 동작");
		String stmt = PROMISE_NS + "updatePromise";
		return template.update(stmt, promise);
	}

	@Override
	public int deletePromise(int promiseId) {
		logger.trace("PromiseDaoImpl - deletePromise 동작");
		String stmt = PROMISE_NS + "deletePromise";
		return template.update(stmt, promiseId);
	}

}
