package service;

import dto.BoardLocation;

public interface BoardLoactionService {
	public BoardLocation selectBoard(int boradNo);
	public int insertBoardLocation(BoardLocation boardLocation);
}
