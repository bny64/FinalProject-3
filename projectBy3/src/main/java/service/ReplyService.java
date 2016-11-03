package service;

import java.util.List;

import dto.Reply;

public interface ReplyService {
	public List<Reply> selectReplyByBoardNo(int boardNo);
	public int insertReply(Reply reply);
}
