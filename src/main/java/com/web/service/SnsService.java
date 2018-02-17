package com.web.service;

import java.util.List;

import com.web.model.SnspageVO;
import com.web.model.UserVO;

public interface SnsService {
	
	int snspage_getCount();
	List<SnspageVO> getallsnspage(int start,int end);
	SnspageVO getsnspage(String name);
	int snspage_pageproimgnameUp(SnspageVO dto);
	int snspage_pagemainimgnameUp(SnspageVO dto);
	int snspage_pagenameUp(SnspageVO dto);
	int sns_snspage_pageprocontent(SnspageVO dto);
	int insertsnspage(UserVO udto);
	int snspage_del(int user_no);
	
}

