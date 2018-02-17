package com.web.service;

import java.util.List;

import com.web.model.SnsboardVO;

public interface SnsboardService {

	SnsboardVO getboard(String id);
	int getboardno(String id);
	int inputboard(SnsboardVO dto);
	int snsboard_del(SnsboardVO dto);
	List<SnsboardVO> getallboard(String id); 
	
}
