package com.web.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.SearchDao;
import com.web.model.MusicVO;
import com.web.model.MusicboardVO;

@Repository("searchDao")
public class SearchDaoImpl implements SearchDao {
	  
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int GetCount() {
	   List<MusicboardVO> list= sqlSession.selectList("search_getCount");
	   return list.size();
	}   
	@Override  
	public List<MusicboardVO> SearchAll(int start,int end) {   
	      Map map = new HashMap();
	      map.put("start", start);
	      map.put("end", end);
	      return sqlSession.selectList("searchAll",map);
	}
	@Override
	public List<MusicboardVO> searchViewArtist(int start,int end ,String searchString) {   
	      Map map = new HashMap();
	      map.put("start", start);
	      map.put("end", end);
	      map.put("searchString", searchString);
	      return sqlSession.selectList("searchViewArtist",map);
	}
	   
	@Override
	public List<MusicboardVO> searchViewAlbum(int start,int end ,String searchString) {   
	      Map map = new HashMap();
	      map.put("start", start);
	      map.put("end", end);
	      map.put("searchString", searchString);
	      return sqlSession.selectList("searchViewAlbum",map);
	}
	   
	@Override 
	public List<MusicVO> SearchViewMusicName(int start, int end, String searchString) {
	      Map map = new HashMap();
	      map.put("start", start);
	      map.put("end", end);
	      map.put("searchString", searchString);
	      return sqlSession.selectList("searchViewMusicName",map);
	}

	@Override 
	public List<MusicboardVO> Search(String searchString) {   
	      return sqlSession.selectList("search",searchString);
	}

	@Override 
	public List<MusicboardVO> SearchArtist(String searchString) {   
	      return sqlSession.selectList("searchArtist",searchString);
	}
	   
	@Override  
	public List<MusicboardVO> SearchAlbum(String searchString) {   
	      return sqlSession.selectList("searchAlbum",searchString);
	}
	   
	@Override  
	public List<MusicVO> SearchMusicName(String searchString) {   
	      return sqlSession.selectList("searchMusicName",searchString);
	}
	   
	@Override 
	public MusicboardVO getMusicBoard(int music_musicboardno) {
	      return sqlSession.selectOne("getMBoard", music_musicboardno);
	}
	   
	@Override
	public List<MusicboardVO> SearchAllGenre(int start,int end,String genre) {   
	      Map map = new HashMap();
	      map.put("start", start);
	      map.put("end", end);
	      map.put("genre", genre);
	      return sqlSession.selectList("SearchAllGenre",map);
	}
	   
	@Override 
	public int searchGenre_GetCount(String genre) {
	      int res = sqlSession.selectOne("searchGenre_GetCount" , genre);
	      return res;
	}

}
