package com.web.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.SnsboardDao;
import com.web.model.SnsboardVO;

@Repository("snsboardDao")
public class SnsboardDaoImpl implements SnsboardDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public SnsboardVO getboard(String id) {
		return sqlSession.selectOne("getboard",id);
	}
	
	@Override
	public List<SnsboardVO> getallboard(String id) {

		return sqlSession.selectList("getallboard",id);
	}
	@Override
	public int getboardno(String id) {
		List<SnsboardVO> list = sqlSession.selectList("getallboard",id);
		
		return list.size();
	}
	@Override
	public int inputboard(SnsboardVO dto) {
		return sqlSession.insert("inputboard",dto);
	}
	@Override
	public int snsboard_del(SnsboardVO dto) {
		return sqlSession.delete("snsboard_del",dto);
	}

	
	
}
