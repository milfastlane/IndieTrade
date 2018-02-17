package com.web.service;

import java.util.List;

import com.web.model.MusicVO;
import com.web.model.MusicboardVO;

public interface MusicboardService {

	int insertMusicBoard(MusicboardVO dto);
	List<MusicboardVO> allMusicBoard();
	MusicboardVO getMusicBoarddto(MusicboardVO dto);
	int insertMusic(MusicVO dto);
	List<MusicVO> getMusic(MusicboardVO dto);
	MusicboardVO getMusicboard(int no);
	MusicboardVO getMusicboard2(MusicboardVO dto);
	MusicboardVO getMusicboardlike(int musicboard_no);
	List<MusicVO> getMusics(int no);
	int musicboard_del(int musicboard_no);
	int music_del(int musicboard_no);
	int checkduplicatedmusicboard(MusicboardVO bdto);
	
}
