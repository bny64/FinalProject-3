package dao;

import java.util.List;
import java.util.Map;

import dto.BoardLocation;

public interface BoardLoactionDao {
	public BoardLocation selectBoard(int boradNo);
	public int insertBoardLocation(BoardLocation boardLocation);
	public List<Integer> getBoardsBycenterLocation(Map<String, Object> filter);
}
