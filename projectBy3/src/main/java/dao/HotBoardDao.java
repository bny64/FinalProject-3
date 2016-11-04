package dao;

import java.util.List;

import dto.HotBoard;

public interface HotBoardDao {
	public List<HotBoard> selectHotBoardByCategory(int categoryNo); 
	public int insertHotBoard(HotBoard hotBoard);
	public List<HotBoard> selectAllHotBoard();
}
