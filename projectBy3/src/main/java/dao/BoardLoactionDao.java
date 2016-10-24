package dao;

import dto.BoardLocation;

public interface BoardLoactionDao {
	public BoardLocation selectBoard(int boradNo);
	public int insertBoardLocation(BoardLocation boardLocation);
}
