package dao;

import java.util.List;

import dto.Promise;

public interface PromiseDao {
	List<Promise> getAllPromise();
	/**
	 * 사용자 번호로 주최한 약속들을 가져온다.
	 * @param userNo
	 * @return
	 */
	List<Promise> getMyPromiseByPromote(int userNo);
	/**
	 * 사용자 번호로 초대받은 약속들을 가져온다.
	 * @param userNo
	 * @return
	 */
	List<Promise> getMyPromiseByInvitee(int userNo);
	
	public int insertPromise(Promise promise);
	public int updatePromise(Promise promise);
}
