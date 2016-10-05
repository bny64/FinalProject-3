package service;

import java.util.List;

import dto.Board;

public interface BoardService {
	public List<Board> viewAllBoards();
	public Board selectBoard(int boardNo);
	public List<Board> selectMyBoard(int userNo);
}