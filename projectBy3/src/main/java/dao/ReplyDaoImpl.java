package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao{
	
	static Logger logger = LoggerFactory.getLogger(ReplyDaoImpl.class);
	final static String REPLY_NS = "ReplyMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	@Override
	public List<Reply> selectReplyByBoardNo(int boardNo) {
		logger.trace("ReplyDaoImpl - selectReplyByBoardNo 동작");
		String stmt = REPLY_NS + "selectReplyByBoardNo";
		return template.selectList(stmt,boardNo);
	}


	@Override
	public int insertReply(Reply reply) {
		logger.trace("ReplyDaoImpl - insertReply 동작");
		String stmt = REPLY_NS + "insertReply";
		return template.insert(stmt, reply);
	}

}
