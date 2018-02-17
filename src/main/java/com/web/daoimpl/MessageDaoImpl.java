package com.web.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.MessageDao;
import com.web.model.MessageVO;

@Repository("messageDao")
public class MessageDaoImpl implements MessageDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMessage(MessageVO dto) {	
		return sqlSession.insert("insertMessage", dto);
	}
	@Override
	public int updateIsDeletedByReceiver(int message_no) {
		return sqlSession.update("updateisdeletedbyreceiver", message_no);
	}
	@Override
	public int updateIsDeletedBySender(int message_no) {
		return sqlSession.update("updateisdeletedbysender", message_no);
	}
	@Override
	public int updateHide(int message_no) {
		return sqlSession.update("updatehide", message_no);
	}
	@Override
	public MessageVO getMessage(int message_no) {
		return sqlSession.selectOne("getMessage", message_no);
	}
	@Override
	public int deleteMessage(int message_no) {
		return sqlSession.delete("deleteMessage", message_no);
	}
	@Override
	public int getCount_receivedlistfromuser(String adminid) {
		
		int no = sqlSession.selectOne("getCount_receivedlistfromuser", adminid);
		return no;
	}
	@Override
	public int getCount_receivedlistfromuser_byCond(String adminid, String searchString) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("adminid", (String)adminid);
		map.put("searchString", (String)searchString);
		int no = sqlSession.selectOne("getCount_receivedlistfromuser_byCond", map);
		return no;
	}
	@Override
	public int getCount_receivedlistfromadmin(String userid) {
		
		int no = sqlSession.selectOne("getCount_receivedlistfromadmin", userid);
		return no;
	}
	@Override
	public int getCount_receivedlistfromadmin_byCond(String userid, String searchString) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", (String)userid);
		map.put("searchString", (String)searchString);
		int no = sqlSession.selectOne("getCount_receivedlistfromadmin_byCond", map);
		return no;
	}

	@Override
	public int getCount_sentlistfromadmin(String adminid) {
		int no = sqlSession.selectOne("getCount_sentlistfromadmin", adminid);
		return no;
	}
	@Override
	public int getCount_sentlistfromadmin_byCond(String adminid, String searchString) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("adminid", (String)adminid);
		map.put("searchString", (String)searchString);
		int no = sqlSession.selectOne("getCount_sentlistfromadmin_byCond", map);
		return no;
	}
	@Override
	public int getCount_sentlistfromuser(String userid) {
		int no = sqlSession.selectOne("getCount_sentlistfromuser", userid);
		return no;
	}
	@Override
	public int getCount_sentlistfromuser_byCond(String userid, String searchString) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", (String)userid);
		map.put("searchString", (String)searchString);
		int no = sqlSession.selectOne("getCount_sentlistfromuser_byCond", map);
		return no;
	}

	
	@Override
	public List<MessageVO> sentlistfromadmin(String adminid, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("adminid", (String)adminid);
		map.put("start", (int)startRow);
		map.put("end", (int)endRow);

		List<MessageVO> list = sqlSession.selectList("sentlistfromadmin", map);
		return list;
	}
	@Override
	public List<MessageVO> receivedlistfromuser(String adminid, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("adminid", (String)adminid);
		map.put("start", (int)startRow);
		map.put("end", (int)endRow);
		
		List<MessageVO> list = sqlSession.selectList("receivedlistfromuser", map);
		return list;
	}

	@Override
	public List<MessageVO> sentlistfromuser(String userid, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", (String)userid);
		map.put("start", (int)startRow);
		map.put("end", (int)endRow);
		List<MessageVO> list = sqlSession.selectList("sentlistfromuser", map);
		return list;
	}
	@Override
	public List<MessageVO> receivedlistfromadmin(String userid, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", (String)userid);
		map.put("start", (int)startRow);
		map.put("end", (int)endRow);
		List<MessageVO> list = sqlSession.selectList("receivedlistfromadmin", map);
		return list;
	}
	@Override
	public void updateMessageRead(int message_no) {
		sqlSession.update("updatemessageread", message_no);
		
	}

}
