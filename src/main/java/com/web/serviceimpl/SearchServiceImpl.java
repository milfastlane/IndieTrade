package com.web.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.dao.SearchDao;
import com.web.model.MusicVO;
import com.web.model.MusicboardVO;
import com.web.service.SearchService;

@Service("searchService")
public class SearchServiceImpl implements SearchService {

	@Resource(name="searchDao")
	private SearchDao searchDao;
	
	@Override
	public int GetCount() {
		// TODO Auto-generated method stub
		return searchDao.GetCount();
	}

	@Override
	public List<MusicboardVO> SearchAll(int start, int end) {
		// TODO Auto-generated method stub
		return searchDao.SearchAll(start, end);
	}

	@Override
	public List<MusicboardVO> searchViewArtist(int start, int end, String searchString) {
		// TODO Auto-generated method stub
		return searchDao.searchViewArtist(start, end, searchString);
	}

	@Override
	public List<MusicboardVO> searchViewAlbum(int start, int end, String searchString) {
		// TODO Auto-generated method stub
		return searchDao.searchViewAlbum(start, end, searchString);
	}

	@Override
	public List<MusicVO> SearchViewMusicName(int start, int end, String searchString) {
		// TODO Auto-generated method stub
		return searchDao.SearchViewMusicName(start, end, searchString);
	}

	@Override
	public List<MusicboardVO> Search(String searchString) {
		// TODO Auto-generated method stub
		return searchDao.Search(searchString);
	}

	@Override
	public List<MusicboardVO> SearchArtist(String searchString) {
		// TODO Auto-generated method stub
		return searchDao.SearchArtist(searchString);
	}

	@Override
	public List<MusicboardVO> SearchAlbum(String searchString) {
		// TODO Auto-generated method stub
		return searchDao.SearchAlbum(searchString);
	}

	@Override
	public List<MusicVO> SearchMusicName(String searchString) {
		// TODO Auto-generated method stub
		return searchDao.SearchMusicName(searchString);
	}

	@Override
	public MusicboardVO getMusicBoard(int music_musicboardno) {
		// TODO Auto-generated method stub
		return searchDao.getMusicBoard(music_musicboardno);
	}

	@Override
	public List<MusicboardVO> SearchAllGenre(int start, int end, String genre) {
		// TODO Auto-generated method stub
		return searchDao.SearchAllGenre(start, end, genre);
	}

	@Override
	public int searchGenre_GetCount(String genre) {
		// TODO Auto-generated method stub
		return searchDao.searchGenre_GetCount(genre);
	}
   
   
}