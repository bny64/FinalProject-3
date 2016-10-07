package dao;

import java.util.List;
import java.util.Map;

import dto.Board;

public interface BoardDao {
	public List<Board> selectAllBoard();
	public Board selectBoard(int boardNo);
	public List<Board> selectMyBoard(int userNo);
	public List<Board> selectMyBoardByPaging(Map<String, Object> filter);
	public List<Board> selectAllBoardByPaging(Map<String, Object> filter);
	public int deleteBoardByBoardNo(int boardNo);
	public int updateBoard(Board board);
	public int insertBoard(Board board);

}
