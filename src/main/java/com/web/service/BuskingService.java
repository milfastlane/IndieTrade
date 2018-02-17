package com.web.service;

import java.util.List;

import com.web.model.BuskingVO;

public interface BuskingService {

	int insertBusking(BuskingVO dto);
	int approveBusking(BuskingVO dto);
	int editBusking(BuskingVO dto);
	int deleteBusking(int busking_no);
	List<BuskingVO> listBusking();
	List<BuskingVO> alllistBusking(int start,int end);
	int busgetCount();
	List<BuskingVO> listMyBusking(String busking_username);
	BuskingVO getBusking(int busking_no);
	
}
