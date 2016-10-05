package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import dto.User;
import exception.IdDuplicatedException;
import exception.IdFailException;
import exception.NicknameDuplicatedException;
import exception.SearchFailException;
import exception.passFailException;

@Service
public class UserServiceImpl implements UserService {

	static Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Autowired
	UserDao uDao;

	@Override
	// 로그인 서비스
	public User loginUser(String userId, String password) {
		logger.trace("ServiceImpl - loginUser 동작");
		User user = uDao.selectUser(userId);
		boolean login = false;

		if (user != null) {

			if (password.equals(user.getPassword())) {
				login = true;
				logger.trace("로그인 성공");
			} else {
				logger.error("비밀번호가 맞지 않습니다");
				throw new passFailException();
			}

		} else {
			logger.error("없는 아이디 입니다");
			throw new IdFailException();
		}

		return user;
	}

	@Override
	// 회원 전체 조회 서비스
	public List<User> AllUser() {
		logger.trace("ServiceImpl - AllUser 동작");
		List<User> users = uDao.selectAllUser();
		return users;
	}

	@Override
	// 회원 가입 서비스
	public int insertUser(User user) {
		logger.trace("ServiceImpl - insertUser 동작");
		
		int result;
		User checkuser1 = uDao.selectUser(user.getUserId());
		User checkuser2 = uDao.selectUserByNickname(user.getNickname());
		
		if(checkuser1==null){
			if(checkuser2==null){
				result = uDao.insertUser(user);
				logger.trace("가입 성공");
			}else{
				logger.error("닉네임이 중복됩니다");
				throw new NicknameDuplicatedException();
			}
		}else{
			logger.error("ID가 중복됩니다");
			throw new IdDuplicatedException();
		}
		return result;
	}

	@Override
	public String searchId(String id,String name) {
		logger.trace("ServiceImpl - searchId 동작");
		Map<String,Object> info = new HashMap<>();
		info.put("id", id);
		info.put("name", name);
		User user = uDao.searchId(info);		
		if(user == null){
			logger.trace("없는 아이디");
			throw new IdFailException();
		}
		return user.getUserId();
	}

	@Override
	public String searchPw(String id,String name,String email) {
		logger.trace("ServiceImpl - searchPw 동작");
		Map<String,Object> info = new HashMap<>();
		info.put("id", id);
		info.put("name", name);
		info.put("email", email);		
		
		User user = uDao.searchPw(info);
		
		if(user == null){
			logger.trace("오류");
			throw new SearchFailException();
		}
		
		return user.getPassword();
	}

}
