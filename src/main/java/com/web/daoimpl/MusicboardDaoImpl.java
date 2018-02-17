package com.web.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.MusicboardDao;
import com.web.model.MusicVO;
import com.web.model.MusicboardVO;

@Repository("musicboardDao")
public class MusicboardDaoImpl implements MusicboardDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMusicBoard(MusicboardVO dto) {
		return sqlSession.insert("insertMusicBoard", dto);
	}
	@Override
	public List<MusicboardVO> allMusicBoard() {
		List<MusicboardVO> list= sqlSession.selectList("allMusicboard");
		return list;
	}
	@Override
	public MusicboardVO getMusicBoarddto(MusicboardVO dto) {
		MusicboardVO mdto= sqlSession.selectOne("getMusicBoarddto",dto);
		return mdto;
	}
	
	@Override
	public MusicboardVO getMusicBoard2(MusicboardVO dto) {
		MusicboardVO mdto= sqlSession.selectOne("getMusicBoard2",dto);
		return mdto;
	}
	
	@Override
	public int insertMusic(MusicVO dto) {
		return sqlSession.insert("insertMusic", dto);
	}
	@Override
	public List<MusicVO> getMusic(MusicboardVO dto) {
		return sqlSession.selectList("getMusic", dto);
	}
	@Override
	public MusicboardVO getMusicboard(int no) {
			   sqlSession.update("Count", no);
		return sqlSession.selectOne("getMusicboard", no);
	}
	
	
	@Override
	public MusicboardVO getMusicboardlike(int musicboard_no) {
		return sqlSession.selectOne("getMusicboard", musicboard_no);
	}
	@Override
	public List<MusicVO> getMusics(int no) {
		return sqlSession.selectList("getMusics", no);
	}
	@Override
	public int musicboard_del(int musicboard_no) {
			   sqlSession.delete("musicAll_del", musicboard_no);
		return sqlSession.delete("musicboard_del", musicboard_no);
	}
	@Override
	public int music_del(int musicboard_no) {
		return sqlSession.delete("music_del", musicboard_no);
	}
	@Override
	public int checkduplicatedmusicboard(MusicboardVO bdto) {
		return sqlSession.selectOne("check_duplicated_musicboard", bdto);
	}

}
