package com.web.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.LikeDao;
import com.web.model.LikeVO;

@Repository("likeDao")
public class LikeDaoImpl implements LikeDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int like_snspageUp(LikeVO dto) {
		return sqlSession.insert("like_snspageUp", dto);
	}
	@Override
	public int like_snspageDown(LikeVO dto) {
		return sqlSession.delete("like_snspageDown", dto);
	}
	@Override
	public int like_albumUp(LikeVO dto) {
		return sqlSession.insert("like_albumUp", dto);
	}
	@Override
	public int like_albumDown(LikeVO dto) {
		return sqlSession.delete("like_albumDown", dto);
	}
	@Override
	public int like_isalbum(LikeVO dto) {
		return sqlSession.selectOne("like_isalbum", dto);
	}
	@Override
	public int like_getalbumCount(int like_music_boardno) {
		return sqlSession.selectOne("like_getalbumCount", like_music_boardno);
	}
	@Override
	public int like_issnspage(LikeVO dto) {
		return sqlSession.selectOne("like_issnspage", dto);
	}
	@Override
	public int like_getsnspageCount(String like_sns_artistid) {
		return sqlSession.selectOne("like_getsnspageCount", like_sns_artistid);
	}
	@Override
	public List<LikeVO> mylikelist(String user_id) {
		return sqlSession.selectList("mylikelist", user_id);
	}

}
