package com.web.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.BuskingDao;
import com.web.model.BuskingVO;

@Repository("buskingDao")
public class BuskingDaoImpl implements BuskingDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertBusking(BuskingVO dto) {
		return sqlSession.insert("insertBusking", dto);
	}
	
	@Override
	public int approveBusking(BuskingVO dto) {
		return sqlSession.update("approveBusking", dto);
	}
	@Override
	public int editBusking(BuskingVO dto) {
		return sqlSession.update("editBusking", dto);
	}
	@Override
	public int deleteBusking(int busking_no) {
		return sqlSession.delete("deleteBusking", busking_no);
	}
	@Override
	public List<BuskingVO> listBusking() {
		return sqlSession.selectList("listBusking");
	}
	@Override
	public List<BuskingVO> alllistBusking(int start,int end) {
		Map map = new HashMap();
		map.put( "start", start );
		map.put( "end", end );
		return sqlSession.selectList("alllistBusking",map);
	}
	@Override
	public int busgetCount() {
		int no = sqlSession.selectOne("busgetCount");
		return no;
	}
	@Override
	public List<BuskingVO> listMyBusking(String busking_username) {
		return sqlSession.selectList("listMyBusking", busking_username);
	}
	@Override
	public BuskingVO getBusking(int busking_no) {
		return sqlSession.selectOne("getBusking", busking_no);
	}

}
