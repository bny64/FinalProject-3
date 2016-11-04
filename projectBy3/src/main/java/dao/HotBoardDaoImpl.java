package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.HotBoard;

@Repository
public class HotBoardDaoImpl implements HotBoardDao{
	static Logger logger = LoggerFactory.getLogger(HotBoardDaoImpl.class);
	final static String HOTBOARD_NS = "HotBoardMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<HotBoard> selectHotBoardByCategory(int categoryNo) {
		logger.trace("HotBoardDaoImpl - selectHotBoardByCategory ");
		String stmt = HOTBOARD_NS + "selectHotBoardByCategory";
		return template.selectList(stmt,categoryNo);
	}

	@Override
	public int insertHotBoard(HotBoard hotBoard) {
		logger.trace("HotBoardDaoImpl - insertHotBoard ");
		String stmt = HOTBOARD_NS + "insertHotBoard";
		return template.insert(stmt,hotBoard);
	}

	@Override
	public List<HotBoard> selectAllHotBoard() {
		logger.trace("HotBoardDaoImpl - selectAllHotBoard ");
		String stmt = HOTBOARD_NS + "selectAllHotBoard";
		return template.selectList(stmt);
	}

}
