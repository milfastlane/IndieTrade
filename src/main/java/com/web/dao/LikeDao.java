package com.web.dao;

import java.util.List;

import com.web.model.LikeVO;

public interface LikeDao {
	
	int like_snspageUp(LikeVO dto);
	int like_snspageDown(LikeVO dto);
	int like_albumUp(LikeVO dto);
	int like_albumDown(LikeVO dto);
	int like_isalbum(LikeVO dto);
	int like_getalbumCount(int like_music_boardno);
	int like_issnspage(LikeVO dto);
	int like_getsnspageCount(String like_sns_artistid);
	List<LikeVO> mylikelist(String user_id);
		
}
