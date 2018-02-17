package com.web.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.ReplyDao;
import com.web.model.ReplyVO;
import com.web.service.ReplyService;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Resource(name="replyDao")
	private ReplyDao replyDao;

	@Override
	public List<ReplyVO> listReplies(Integer qnaboard_no) {
		// TODO Auto-generated method stub
		return replyDao.listReplies(qnaboard_no);
	}

	@Override
	public int insertReply(ReplyVO dto) {
		// TODO Auto-generated method stub
		return replyDao.insertReply(dto);
	}

	@Override
	public int deleteReply(Integer reply_no) {
		// TODO Auto-generated method stub
		return replyDao.deleteReply(reply_no);
	}

}
