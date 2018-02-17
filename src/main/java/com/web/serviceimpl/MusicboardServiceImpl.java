package com.web.serviceimpl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.model.MusicboardVO;
import com.web.service.MusicboardService;
import com.web.dao.MusicboardDao;
import com.web.model.MusicVO;

@Service("musicboardService")
public class MusicboardServiceImpl implements MusicboardService {

	@Resource(name="musicboardDao")
	private MusicboardDao musicboardDao;
	
	@Override
	public int insertMusicBoard(MusicboardVO dto) {
		// TODO Auto-generated method stub
		return musicboardDao.insertMusicBoard(dto);
	}

	@Override
	public List<MusicboardVO> allMusicBoard() {
		// TODO Auto-generated method stub
		return musicboardDao.allMusicBoard();
	}

	@Override
	public MusicboardVO getMusicBoarddto(MusicboardVO dto) {
		// TODO Auto-generated method stub
		return musicboardDao.getMusicBoarddto(dto);
	}

	@Override
	public int insertMusic(MusicVO dto) {
		// TODO Auto-generated method stub
		return musicboardDao.insertMusic(dto);
	}

	@Override
	public List<MusicVO> getMusic(MusicboardVO dto) {
		// TODO Auto-generated method stub
		return musicboardDao.getMusic(dto);
	}

	@Override
	public MusicboardVO getMusicboard(int musicboard_no) {
		// TODO Auto-generated method stub
		return musicboardDao.getMusicboard(musicboard_no);
	}

	@Override
	public MusicboardVO getMusicboard2(MusicboardVO dto) {
		// TODO Auto-generated method stub
		return musicboardDao.getMusicBoard2(dto);
	}
	
	@Override
	public MusicboardVO getMusicboardlike(int musicboard_no) {
		// TODO Auto-generated method stub
		
		return musicboardDao.getMusicboardlike(musicboard_no);
	}

	@Override
	public List<MusicVO> getMusics(int no) {
		// TODO Auto-generated method stub
		return musicboardDao.getMusics(no);
	}

	@Override
	public int musicboard_del(int musicboard_no) {
		// TODO Auto-generated method stub
		return musicboardDao.musicboard_del(musicboard_no);
	}

	@Override
	public int music_del(int musicboard_no) {
		// TODO Auto-generated method stub
		return musicboardDao.music_del(musicboard_no);
	}

	@Override
	public int checkduplicatedmusicboard(MusicboardVO bdto) {
		// TODO Auto-generated method stub
		return musicboardDao.checkduplicatedmusicboard(bdto);
	}

	
}
