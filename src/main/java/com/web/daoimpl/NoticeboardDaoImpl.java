package com.web.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.NoticeboardDao;
import com.web.model.NoticeboardVO;

@Repository("noticeboardDao")
public class NoticeboardDaoImpl implements NoticeboardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<NoticeboardVO> listNoticeBoard(int startRow, int endRow){
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		map.put("start", startRow);
		map.put("end", endRow);
		
		return sqlSession.selectList("listNoticeBoard", map);
	}
	@Override
	public int insertNoticeBoard(NoticeboardVO dto) {
		return sqlSession.insert("insertNoticeBoard", dto);
	}
	@Override
	public int readCount(int bno) {
		return sqlSession.update("readCountForNoticeBoard", bno);
	}
	@Override
	public NoticeboardVO getNoticeBoard(int bno) {
		return sqlSession.selectOne("getNoticeBoard", bno);
	}

	@Override
	public int deleteNoticeBoard(int num) {
		return sqlSession.delete("deleteNoticeBoard", num);
	}
	@Override
	public int getCount() {
		int no = sqlSession.selectOne("getNoticeCount");
		return no;
	}
	@Override
	public int resetRepresentingNotice() {
		int no = sqlSession.update("resetRepresentingNotice");
		return no;
	}
	@Override
	public int setRepresentingNotice(int noticeboard_no) {
		int no = sqlSession.update("setRepresentingNotice", noticeboard_no);
		return no;
		
	}

	public NoticeboardVO getRepresentingNoticeBoard() {
		return sqlSession.selectOne("getRepresentingNoticeBoard");
	}


}
