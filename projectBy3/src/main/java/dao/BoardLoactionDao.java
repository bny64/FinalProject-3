package dao;

import java.util.List;

import dto.BoardLocation;

public interface BoardLoactionDao {
	public BoardLocation selectBoard(int boradNo);
	public int insertBoardLocation(BoardLocation boardLocation);
	public List<BoardLocation> selectBoardLocationByUserNo(int userNo);	
}
