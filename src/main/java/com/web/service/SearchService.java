package com.web.service;

import java.util.List;

import com.web.model.MusicVO;
import com.web.model.MusicboardVO;

public interface SearchService {
	
	int GetCount();
	List<MusicboardVO> SearchAll(int start,int end);
	List<MusicboardVO> searchViewArtist(int start, int end, String searchString);
	List<MusicboardVO> searchViewAlbum(int start,int end ,String searchString);
	List<MusicVO> SearchViewMusicName(int start, int end, String searchString);
	List<MusicboardVO> Search(String searchString);
	List<MusicboardVO> SearchArtist(String searchString);
	List<MusicboardVO> SearchAlbum(String searchString);
	List<MusicVO> SearchMusicName(String searchString);
	MusicboardVO getMusicBoard(int music_musicboardno);
	List<MusicboardVO> SearchAllGenre(int start,int end,String genre);
	int searchGenre_GetCount(String genre);
	
}
