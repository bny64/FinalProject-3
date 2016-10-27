package service;

import java.util.List;

import dto.BoardLocation;

public interface BoardLoactionService {
	public BoardLocation selectBoard(int boradNo);
	public int insertBoardLocation(BoardLocation boardLocation);
	public List<BoardLocation> selectBoardLocationByUserNo(int userNo);
}
