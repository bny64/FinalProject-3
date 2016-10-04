package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import dto.User;
import exception.IdDuplicatedException;
import exception.IdFailException;
import exception.NicknameDuplicatedException;
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

		if (user != null) {

			if (password.equals(user.getPassword())) {
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
		List<User> users = uDao.selectAllUser();
		for (User user1 : users) {

			if (user.getUserId().equals(user1.getUserId())) {
				throw new IdDuplicatedException();
			} else {

				if (user.getNickname().equals(user1.getNickname())) {
					throw new NicknameDuplicatedException();
				} else {

					result = uDao.insertUser(user);

				}

			}

		}
		return result;

	}

}
