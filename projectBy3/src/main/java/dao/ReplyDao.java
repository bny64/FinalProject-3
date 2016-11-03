package dao;

import java.util.List;

import dto.Reply;

public interface ReplyDao {
	public List<Reply> selectReplyByBoardNo(int boardNo);
	public int insertReply(Reply reply);
}
