package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserHistoryDao;
import dto.UserHistory;

@Service
public class UserHistoryServiceImpl implements UserHistoryService{
	
	
	@Autowired
	UserHistoryDao dao;
	
	@Override
	public int insertUserHistory(int userNo, int boardNo) {
		UserHistory userHistory = new UserHistory(userNo,boardNo);
		return dao.insertUserHistory(userHistory);
	}

}
