package dao;

import java.util.List;

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
}
