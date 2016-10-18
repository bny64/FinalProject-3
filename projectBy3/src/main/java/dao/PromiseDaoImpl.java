package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Promise;

@Repository
public class PromiseDaoImpl implements PromiseDao{

	final static String PROMISE_NS = "PromiseMapper.";
	
	@Autowired
	SqlSessionTemplate template;
	
	@Override
	public List<Promise> getAllPromise() {
		String stmt = PROMISE_NS + "getAllPromise";
		return template.selectList(stmt);
	}

	@Override
	public List<Promise> getMyPromiseByPromote(int userNo) {
		String stmt = PROMISE_NS + "getMyPromiseByPromote";
		return template.selectList(stmt, userNo);
	}

	@Override
	public List<Promise> getMyPromiseByInvitee(int userNo) {
		String stmt = PROMISE_NS + "getMyPromiseByInvitee";
		return template.selectList(stmt, userNo);
	}

}
