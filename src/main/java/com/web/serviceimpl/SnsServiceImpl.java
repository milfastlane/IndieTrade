package com.web.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.LogDao;
import com.web.dao.SnsDao;
import com.web.dao.SnsboardDao;
import com.web.model.SnspageVO;
import com.web.model.UserVO;
import com.web.service.SnsService;

@Service("snsService")
public class SnsServiceImpl implements SnsService{

	@Resource(name="snsDao")
	private SnsDao snsDao;
	
	@Resource(name="snsboardDao")
	private SnsboardDao snsboardDao;
	
	@Resource(name="logDao")
	private LogDao logDao;
	
	

	@Override
	public int snspage_getCount() {
		// TODO Auto-generated method stub
		return snsDao.snspage_getCount();
	}

	@Override
	public List<SnspageVO> getallsnspage(int start, int end) {
		// TODO Auto-generated method stub
		return snsDao.getallsnspage(start, end);
	}

	@Override
	public SnspageVO getsnspage(String name) {
		// TODO Auto-generated method stub
		return snsDao.getsnspage(name);
	}

	@Override
	public int snspage_pageproimgnameUp(SnspageVO dto) {
		// TODO Auto-generated method stub
		return snsDao.snspage_pageproimgnameUp(dto);
	}

	@Override
	public int snspage_pagemainimgnameUp(SnspageVO dto) {
		// TODO Auto-generated method stub
		return snsDao.snspage_pagemainimgnameUp(dto);
	}

	@Override
	public int snspage_pagenameUp(SnspageVO dto) {
		// TODO Auto-generated method stub
		return snsDao.snspage_pagenameUp(dto);
	}

	@Override
	public int sns_snspage_pageprocontent(SnspageVO dto) {
		// TODO Auto-generated method stub
		return snsDao.sns_snspage_pageprocontent(dto);
	}

	@Override
	public int insertsnspage(UserVO udto) {
		// TODO Auto-generated method stub
		return snsDao.insertsnspage(udto);
	}

	@Override
	public int snspage_del(int user_no) {
		// TODO Auto-generated method stub
		//UserVO vo = logDao.getMember_no(user_no);
		System.out.println("JP user_no 는 : " + user_no);
		return snsDao.snspage_del(user_no);
	}
	
	
	
	
}
