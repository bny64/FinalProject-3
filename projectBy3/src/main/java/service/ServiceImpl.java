package service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import dao.UserDao;
import dto.User;
import exception.IdFailException;
import exception.passFailException;

@org.springframework.stereotype.Service
public class ServiceImpl implements Service {

	static Logger logger = LoggerFactory.getLogger(ServiceImpl.class);

	@Autowired
	UserDao uDao;

	@Override
	public User loginUser(String userId, String password) {
		User user = uDao.selectUser(userId);

		if(user!=null){
			
			if(password.equals(user.getPassword())){
				logger.trace("로그인 성공");
			}else{
				logger.error("비밀번호가 맞지 않습니다");
				throw new passFailException();
			}
			
		}else{
			logger.error("없는 아이디 입니다");
			throw new IdFailException();
		}
		
		return user;
	}

}
