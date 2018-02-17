package com.web.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.SnsDao;
import com.web.model.SnspageVO;
import com.web.model.UserVO;

@Repository("snsDao")
public class SnsDaoImpl implements SnsDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int snspage_getCount() {
		List<SnspageVO> alist= sqlSession.selectList("snspage_getCount");
		return alist.size();
	}
	@Override
	public List<SnspageVO> getallsnspage(int start,int end) {
		Map map = new HashMap();
		map.put( "start", start );
		map.put( "end", end );
		return sqlSession.selectList("getallsnspage",map);
	}
	@Override
	public SnspageVO getsnspage(String name) {
		return sqlSession.selectOne("getsnspage",name);
	}
	@Override
	public int snspage_pageproimgnameUp(SnspageVO dto) {
		return sqlSession.update("snspage_pageproimgnameUp",dto);
	}
	@Override
	public int snspage_pagemainimgnameUp(SnspageVO dto) {
		return sqlSession.update("snspage_pagemainimgnameUp",dto);
	}
	@Override
	public int snspage_pagenameUp(SnspageVO dto) {
		return sqlSession.update("snspage_pagenameUp",dto);
	}
	@Override
	public int sns_snspage_pageprocontent(SnspageVO dto) {
		return sqlSession.update("snspage_pageprocontent",dto);
	}
	@Override
	public int insertsnspage(UserVO udto) {
		return sqlSession.insert("insertsnspage",udto);
	}
	@Override
	public int snspage_del(int user_no) {
		UserVO dto = null;
		dto = (UserVO)sqlSession.selectOne("getMember_no", user_no);
		
		return sqlSession.delete("snspage_del", user_no);
	}

}
