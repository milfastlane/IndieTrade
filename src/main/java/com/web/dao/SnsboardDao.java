package com.web.dao;

import java.util.List;

import com.web.model.SnsboardVO;

public interface SnsboardDao {
	
	SnsboardVO getboard(String id);
	List<SnsboardVO> getallboard(String id);
	int getboardno(String id);
	int inputboard(SnsboardVO dto);
	int snsboard_del(SnsboardVO dto); 
	
}
