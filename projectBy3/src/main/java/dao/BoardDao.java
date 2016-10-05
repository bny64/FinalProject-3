package dao;

import java.util.List;

import dto.Board;

public interface BoardDao {
	public List<Board> selectAllBoard();
	public Board selectBoard(int boardNo);
	public List<Board> selectMyBoard(int userNo);
}
