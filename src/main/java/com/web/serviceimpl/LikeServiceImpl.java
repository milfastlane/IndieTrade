package com.web.serviceimpl;


import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.LikeDao;
import com.web.model.LikeVO;
import com.web.service.LikeService;



@Service("likeService")
public class LikeServiceImpl implements LikeService {

	@Resource(name="likeDao")
	private LikeDao likeDao;

	@Override
	public int like_snspageUp(LikeVO dto) {
		// TODO Auto-generated method stub
		return likeDao.like_snspageUp(dto);
	}

	@Override
	public int like_snspageDown(LikeVO dto) {
		// TODO Auto-generated method stub
		return likeDao.like_snspageDown(dto);
	}

	@Override
	public int like_albumUp(LikeVO dto) {
		// TODO Auto-generated method stub
		return likeDao.like_albumUp(dto);
	}

	@Override
	public int like_albumDown(LikeVO dto) {
		// TODO Auto-generated method stub
		return likeDao.like_albumDown(dto);
	}

	@Override
	public int like_isalbum(LikeVO dto) {
		// TODO Auto-generated method stub
		return likeDao.like_isalbum(dto);
	}

	@Override
	public int like_getalbumCount(int like_music_boardno) {
		// TODO Auto-generated method stub
		return likeDao.like_getalbumCount(like_music_boardno);
	}

	@Override
	public int like_issnspage(LikeVO dto) {
		// TODO Auto-generated method stub
		return likeDao.like_issnspage(dto);
	}

	@Override
	public int like_getsnspageCount(String like_sns_artistid) {
		// TODO Auto-generated method stub
		return likeDao.like_getsnspageCount(like_sns_artistid);
	}

	@Override
	public List<LikeVO> mylikelist(String user_id) {
		// TODO Auto-generated method stub
		return likeDao.mylikelist(user_id);
	}
	

}
