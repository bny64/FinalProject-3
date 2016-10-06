package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Board;

@Repository
public class BoardDaoImpl implements BoardDao{

	final static String BOARD_NS = "BoardMapper.";
	
	static Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<Board> selectAllBoard() {
		logger.trace("BoardDaoImpl - selectAllBoard 동작");
		String stmt = BOARD_NS + "selectAllBoard";
		return template.selectList(stmt);
	}

	@Override
	public Board selectBoard(int boardNo) {
		logger.trace("BoardDaoImpl - selectBoard 동작");
		String stmt = BOARD_NS + "selectBoard";
		return template.selectOne(stmt, boardNo);
	}

	@Override
	public List<Board> selectMyBoard(int userNo) {
		logger.trace("BoardDaoImpl - selectMyBoard 동작");
		String stmt = BOARD_NS + "selectMyBoard";
		return template.selectList(stmt, userNo);
	}

	@Override
	public List<Board> selectAllBoardByPaging(Map<String, Object> filter) {
		logger.trace("BoardDaoImpl - selectAllBoardByPaging 동작");
		String stmt = BOARD_NS + "selectAllBoardByPaging";
		return template.selectList(stmt, filter);
	}
}
