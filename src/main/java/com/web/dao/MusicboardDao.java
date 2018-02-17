package com.web.dao;

import java.util.List;

import com.web.model.MusicVO;
import com.web.model.MusicboardVO;

public interface MusicboardDao {
	
	int insertMusicBoard(MusicboardVO dto);
	List<MusicboardVO> allMusicBoard();
	MusicboardVO getMusicBoarddto(MusicboardVO dto);
	int insertMusic(MusicVO dto);
	List<MusicVO> getMusic(MusicboardVO dto);
	MusicboardVO getMusicboard(int no);
	MusicboardVO getMusicboardlike(int musicboard_no);
	List<MusicVO> getMusics(int no);
	int musicboard_del(int musicboard_no);
	int music_del(int musicboard_no);
	int checkduplicatedmusicboard(MusicboardVO bdto);
	MusicboardVO getMusicBoard2(MusicboardVO dto);
	
}
