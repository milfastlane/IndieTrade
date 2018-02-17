package com.web.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.dao.SnsboardDao;
import com.web.model.SnsboardVO;
import com.web.service.SnsboardService;

@Service("snsboardService")
public class SnsboardServiceImpl implements SnsboardService {
	
	@Resource(name="snsboardDao")
	private SnsboardDao snsboardDao;

	@Override
	public List<SnsboardVO> getallboard(String id) {
		// TODO Auto-generated method stub
		return snsboardDao.getallboard(id);
	}

	@Override
	public SnsboardVO getboard(String id) {
		// TODO Auto-generated method stub
		return snsboardDao.getboard(id);
	}
	
	@Override
	public int getboardno(String id) {
		// TODO Auto-generated method stub
		return snsboardDao.getboardno(id);
	}

	@Override
	public int inputboard(SnsboardVO dto) {
		// TODO Auto-generated method stub
		return snsboardDao.inputboard(dto);
	}

	@Override
	public int snsboard_del(SnsboardVO dto) {
		// TODO Auto-generated method stub
		return snsboardDao.snsboard_del(dto);
	}

	
	

}
