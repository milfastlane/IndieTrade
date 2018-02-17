package com.web.dao;

import java.util.List;

import com.web.model.ReplyVO;

public interface ReplyDao {
	
	List<ReplyVO> listReplies(Integer qnaboard_no);
	int insertReply(ReplyVO dto);
	int deleteReply(Integer reply_no);
	
}
