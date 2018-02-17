package com.web.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.ReplyDao;
import com.web.model.ReplyVO;

@Repository("ReplyDao")
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
    public List<ReplyVO> listReplies(Integer qnaboard_no) {
        return sqlSession.selectList("listreply", qnaboard_no);
    }
	
	@Override
    public int insertReply(ReplyVO dto) {
        return sqlSession.insert("insertreply", dto);
    }
	
	@Override
	public int deleteReply(Integer reply_no) {
		return sqlSession.delete("deletereply", reply_no);
		
	}

}
