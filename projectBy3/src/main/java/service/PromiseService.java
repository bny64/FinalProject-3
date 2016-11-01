package service;

import java.util.Map;

import dto.Promise;

public interface PromiseService {
	public int insertPromise(Promise promise);
	public int updatePromise(Map<String, Object> ProAndDate, Promise promise);
}
