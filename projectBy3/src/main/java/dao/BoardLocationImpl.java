package dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.BoardLocation;

@Repository
public class BoardLocationImpl implements BoardLoactionDao{
	static Logger logger = LoggerFactory.getLogger(BoardLocationImpl.class);
	final static String BOARD_NS = "BoardLocationMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public BoardLocation selectBoard(int boradNo) {
		logger.trace("BoardLocationImpl - selectBoard");
		String stmt = BOARD_NS + "selectBoardLocation";
		return template.selectOne(stmt, boradNo);
	}

	@Override
	public int insertBoardLocation(BoardLocation boardLocation) {
		logger.trace("BoardLocationImpl - insertBoardLocation");
		String stmt = BOARD_NS + "insertBoardLocation";
		return template.insert(stmt,boardLocation);
	}
	
	@Override
	public List<BoardLocation> selectBoardLocationByUserNo(int userNo) {
		logger.trace("BoardLocationImpl - selectBoardLocationByUserNo 동작");
		String stmt = BOARD_NS + "selectBoardLocationByUserId";
		return template.selectList(stmt, userNo);
	}

	@Override
	public List<Integer> getBoardsBycenterLocation(Map<String, Object> filter) {
		// TODO Auto-generated method stub
		return null;
	}
}
