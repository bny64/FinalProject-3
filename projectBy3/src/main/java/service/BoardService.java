package service;

import java.util.List;
import java.util.Map;

import dto.Board;

public interface BoardService {
	public List<Board> viewAllBoards();
	public Board selectBoard(int boardNo);
	public List<Board> selectMyBoard(int userNo);
	public List<Board> selectMyBoardByPaging(int userNo,int pageNo);
	public List<Board> selectAllBoardByPaging(int pageNo,int userNo);
	public int deleteBoardByBoardNo(int boardNo);
	public int updateBoard(Board board);
	public int insertBoard(Board board);
	public List<Board> selectMyCategoryBoardByPaging(int userNo,int pageNo,int categoryNo);
	public List<Board> searchByTitleContent(int pageNo, String search);
	public List<Board> searchByTitleContentCategory(int pageNo,int categoryNo,String search);
}
