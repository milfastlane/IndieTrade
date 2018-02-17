package com.web.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.QnaboardDao;
import com.web.model.QnAboardVO;
import com.web.model.UserVO;

@Repository("qnaboardDao")
public class QnaboardDaoImpl implements QnaboardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<QnAboardVO> listQnaBoard(){
		return sqlSession.selectList("listQnaBoard");
	}
	@Override
	public int insertQnaBoard(QnAboardVO dto) {
		return sqlSession.insert("insertQnaBoard", dto);
	}
	@Override
	public int readCount(int qnaboard_no) {
		return sqlSession.update("readCount", qnaboard_no);
	}
	@Override
	public int updateRecnt(int qnaboard_no) {
		return sqlSession.update("updateRecnt", qnaboard_no);
	}
	@Override
	public int DeupdateRecnt(int qnaboard_no) {
		return sqlSession.update("DeupdateRecnt", qnaboard_no);
	}
	@Override
	public QnAboardVO getQnaBoard(int qnaboard_no) {
		return sqlSession.selectOne("getQnaBoard", qnaboard_no);
	}

	@Override
	public boolean isPasswordCorrect(int qnaboard_no, String passwd) {
		QnAboardVO dto = sqlSession.selectOne("getQnaBoard", qnaboard_no);
		if (dto.getQnaboard_passwd().equals(passwd)) {
			return true;
		}
		return false;
	}
	@Override
	public int deleteQnaBoard(int qnaboard_no) {
		return sqlSession.delete("deleteQnaBoard", qnaboard_no);
	}
	@Override
	public int updateQnaBoard(QnAboardVO dto) {
		return sqlSession.update("updateQnaBoard", dto);
	}
	@Override
	public int getCount() {
		int no = sqlSession.selectOne("getQnaCount");
		return no;
	}

	@Override
	public List<UserVO> getAllQnaBoard(int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", null);
		map.put("searchString", (String)"");
		map.put("start", (int)startRow);
		map.put("end", (int)endRow);


		List<UserVO> list = sqlSession.selectList("listAllQnaBoard", map);

		return list;
	}
	@Override
	public List<UserVO> search(String searchOption, String searchString, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(searchOption!=null && searchString==null) {
			map.put("searchOption", null);
			map.put("searchString", (String)"");
		}else {
			map.put("searchOption", (String)searchOption);
			map.put("searchString", (String)searchString);
		}
		map.put("start", (int)startRow);
		map.put("end", (int)endRow);

		List<UserVO> list = sqlSession.selectList("listAllQnaBoard", map);

		return list;
	}
	@Override
	public int getCountByCondition(String searchOption, String searchString) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("searchString", searchString);
		int no = sqlSession.selectOne("getQnaCountByCondition", map);

		return no;
	}

	
}
