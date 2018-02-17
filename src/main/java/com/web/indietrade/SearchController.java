package com.web.indietrade;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.MusicVO;
import com.web.model.MusicboardVO;
import com.web.model.UserVO;
import com.web.service.LogService;
import com.web.service.SearchService;

@Controller
public class SearchController {
	@Autowired
	private LogService logService;
	
	@Autowired
	private SearchService searchService;

	@RequestMapping(value="/search")
	public ModelAndView Search(@RequestParam(value = "searchString" , required = false) String searchString, HttpServletRequest req){

		List<MusicboardVO> searchResult;  
		List<MusicboardVO> searchArtist;
		List<MusicboardVO> searchAlbum;
		List<MusicVO> searchMusicName;
		
		String pageNum = req.getParameter("pageNum");
		ModelAndView mav = new ModelAndView();
		int searchStringnum;
		
		if(searchString==null) {
			searchStringnum = 1;
		}else if(searchString.equals("")){
			searchStringnum = 1;
		}else {
			searchStringnum = 2;
		}
		switch (searchStringnum) {
		case 1:
			if(pageNum==null){
				pageNum ="1";
			}
			int pageSize = 12;
			int currentPage = Integer.parseInt(pageNum);
			int startRow =(currentPage-1)*pageSize+1;
			int endRow = startRow+pageSize-1;
			int count = searchService.GetCount();
			if(endRow>count) {endRow=count;}
			
			int pageCount = count/pageSize + (count%pageSize==0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount)endPage=pageCount;

			if(startPage > pageBlock) {
				mav.addObject("a", "yes");
			}else {
				mav.addObject("a", "no");
			}
			if(endPage < pageCount) {
				mav.addObject("b", "yes");
			}else {
				mav.addObject("b", "no");
			}
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("pageBlock", pageBlock);
			
			searchResult = searchService.SearchAll(startRow,endRow);
			searchAlbum = searchService.SearchAlbum(searchString);
			searchArtist = searchService.SearchArtist(searchString);
			searchMusicName = searchService.SearchMusicName(searchString);
			
			mav.addObject("searchAll", searchResult);
			mav.addObject("searchString",searchString);
			mav.addObject("searchAlbum", searchAlbum);
			mav.addObject("searchArtist",searchArtist);
			mav.addObject("searchMusicName",searchMusicName);
			mav.setViewName("search/searchAll");
			
			break;

		default:
			searchResult = searchService.Search(searchString);	
			searchAlbum = searchService.SearchAlbum(searchString);
			searchArtist = searchService.SearchArtist(searchString);
			searchMusicName = searchService.SearchMusicName(searchString);
	
			try {
				if(searchMusicName.size() !=0) {
					for(MusicVO num : searchMusicName) {
						MusicboardVO  dto= searchService.getMusicBoard(num.getMusic_musicboardno());
						num.setMusicboard_imgname(dto.getMusicboard_imgname());
					}
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			mav.addObject("search", searchResult);
			mav.addObject("searchAlbum", searchAlbum);
			mav.addObject("searchArtist",searchArtist);
			mav.addObject("searchMusicName",searchMusicName);
			mav.addObject("searchString",searchString);
			mav.setViewName("search/search");	
		
			break;
		}
		
		return mav;
	}
	 
	@RequestMapping(value="/searchviewall", method = RequestMethod.GET)
	public ModelAndView searchviewall(@RequestParam(value = "searchval" , required = false) String searchval,
			@RequestParam(value = "searchString" , required = false) String searchString,
			HttpServletRequest req){

		String pageNum = req.getParameter("pageNum");
		ModelAndView mav = new ModelAndView();
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 12;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = searchService.GetCount();
		if(endRow>count) {endRow=count;}
		
		int pageCount = count/pageSize + (count%pageSize==0 ? 0 : 1);
		int pageBlock = 3;
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount)endPage=pageCount;

		if(startPage > pageBlock) {
			mav.addObject("a", "yes");
		}else {
			mav.addObject("a", "no");
		}
		if(endPage < pageCount) {
			mav.addObject("b", "yes");
		}else {
			mav.addObject("b", "no");
		}
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("pageBlock", pageBlock);
		
		if(searchval.equals("artist")) {
			String searchid = req.getParameter("searchid");
			
			if(searchid != null) {
				UserVO udto = logService.getMember_login_id(searchid);
				searchString = udto.getUser_name();
			}
			List<MusicboardVO> searchViewArtist = searchService.searchViewArtist(startRow,endRow,searchString);
			
			mav.addObject("searchViewArtist", searchViewArtist);
			mav.setViewName("search/searchViewArtist");
			
		}else if(searchval.equals("album")){
			List<MusicboardVO> searchViewAlbum = searchService.searchViewAlbum(startRow,endRow,searchString);
			
			mav.addObject("searchViewAlbum", searchViewAlbum);
			mav.setViewName("search/searchViewAlbum");	
			
		}else if(searchval.equals("musicname")) {
			List<MusicVO> searchViewMusicName = searchService.SearchViewMusicName(startRow,endRow,searchString);
		
			if(searchViewMusicName.size() !=0) {
				for(MusicVO num : searchViewMusicName) {		
					MusicboardVO  dto = searchService.getMusicBoard(num.getMusic_musicboardno());			

					num.setMusicboard_imgname(dto.getMusicboard_imgname());
	
				}
			}
			mav.addObject("searchString",searchString);
			mav.addObject("searchViewMusicName",searchViewMusicName);
			mav.setViewName("search/SearchViewMusicName");
			
		}

		return mav;
	}
	@RequestMapping(value="/searchGenre")
	public ModelAndView searchGenre(HttpServletRequest req){
		String genre= req.getParameter("genre");

		String pageNum = req.getParameter("pageNum");
		ModelAndView mav = new ModelAndView();
		
			if(pageNum==null){
				pageNum ="1";
			}
			int pageSize = 6;
			int currentPage = Integer.parseInt(pageNum);
			int startRow =(currentPage-1)*pageSize+1;
			int endRow = startRow+pageSize-1;
			int count = searchService.searchGenre_GetCount(genre);
			if(endRow>count) {endRow=count;}
			
			int pageCount = count/pageSize + (count%pageSize==0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount)endPage=pageCount;

			if(startPage > pageBlock) {
				mav.addObject("a", "yes");
			}else {
				mav.addObject("a", "no");
			}
			if(endPage < pageCount) {
				mav.addObject("b", "yes");
			}else {
				mav.addObject("b", "no");
			}
			List<MusicboardVO> searchGenre = searchService.SearchAllGenre(startRow,endRow,genre);
			mav.addObject("searchGenre", searchGenre);
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("pageBlock", pageBlock);
			mav.setViewName("search/searchGenre");

		return mav;
	}
	
	
	
}
