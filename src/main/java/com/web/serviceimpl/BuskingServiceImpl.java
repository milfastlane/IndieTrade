package com.web.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.dao.BuskingDao;
import com.web.model.BuskingVO;
import com.web.service.BuskingService;

@Service("buskingService")
public class BuskingServiceImpl implements BuskingService{
	
	@Resource(name="buskingDao")
	private BuskingDao buskingDao;

	@Override
	public int insertBusking(BuskingVO dto) {
		// TODO Auto-generated method stub
		return buskingDao.insertBusking(dto);
	}

	@Override
	public int approveBusking(BuskingVO dto) {
		// TODO Auto-generated method stub
		return buskingDao.approveBusking(dto);
	}

	@Override
	public int editBusking(BuskingVO dto) {
		// TODO Auto-generated method stub
		return buskingDao.editBusking(dto);
	}

	@Override
	public int deleteBusking(int busking_no) {
		// TODO Auto-generated method stub
		return buskingDao.deleteBusking(busking_no);
	}

	@Override
	public List<BuskingVO> listBusking() {
		// TODO Auto-generated method stub
		return buskingDao.listBusking();
	}

	@Override
	public List<BuskingVO> alllistBusking(int start, int end) {
		// TODO Auto-generated method stub
		return buskingDao.alllistBusking(start, end);
	}

	@Override
	public int busgetCount() {
		// TODO Auto-generated method stub
		return buskingDao.busgetCount();
	}

	@Override
	public List<BuskingVO> listMyBusking(String busking_username) {
		// TODO Auto-generated method stub
		return buskingDao.listMyBusking(busking_username);
	}

	@Override
	public BuskingVO getBusking(int busking_no) {
		// TODO Auto-generated method stub
		return buskingDao.getBusking(busking_no);
	}
	
	
}
