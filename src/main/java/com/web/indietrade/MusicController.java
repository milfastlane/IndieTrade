package com.web.indietrade;

import java.io.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.LikeVO;
import com.web.model.MusicVO;
import com.web.model.MusicboardVO;
import com.web.service.LikeService;
import com.web.service.MusicboardService;


@Controller
public class MusicController{

	@Autowired
	private MusicboardService musicboardService;

	@Autowired
	private LikeService likeService;

	@RequestMapping(value="/music_main")
	public ModelAndView music_main() {
		List<MusicboardVO> list = musicboardService.allMusicBoard();
		ModelAndView mav = new ModelAndView();
		mav.addObject("albumList", list);
		mav.setViewName("album/musicMain");
		return mav;
	}

	@RequestMapping(value="/album", method=RequestMethod.GET)
	public ModelAndView album(HttpServletRequest req) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("album/musicMain"); 
		return mav;
	}

	@RequestMapping(value="/writeForm_step2", method=RequestMethod.POST)
	public String writeForm_step2(HttpServletRequest req, @ModelAttribute MusicboardVO dto, BindingResult result) throws Exception {

		if (result.hasErrors()) {
			String artist_name = (String) req.getSession().getAttribute("username"); 
			dto.setMusicboard_artistname(artist_name);
			dto.setMusicboard_imgname("");
		}


		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		String albumimg_name = "";

		String root = mr.getSession().getServletContext().getRealPath("/");
		String uploadPath = root+"resources/albumImage/";


		File dir = new File(uploadPath);
		if(!dir.isDirectory()){
			dir.mkdir();
		}

		MultipartFile imagefile = mr.getFile("musicboard_imgname");
		
		File atarget = new File(uploadPath, imagefile.getOriginalFilename());
		
		if (imagefile.getSize()>0) {
			imagefile.transferTo(atarget);
			albumimg_name = imagefile.getOriginalFilename();
			dto.setMusicboard_imgname(albumimg_name);
		}

		req.getSession().setAttribute("step1", dto);

		return "album/writeForm_step2";
	}

	@RequestMapping(value="/check_duplicated_musicboard")
	public @ResponseBody int check_duplicated_musicboard(HttpServletRequest req, @RequestParam String musicboard_name, @RequestParam String musicboard_artistno) throws Exception{
		
		MusicboardVO bdto = new MusicboardVO();
		bdto.setMusicboard_artistno(Integer.parseInt(musicboard_artistno));
		bdto.setMusicboard_name(musicboard_name);
		
		int res = musicboardService.checkduplicatedmusicboard(bdto);
		
		
		return res;
	}
	
	@RequestMapping(value="/writeForm_step3" ,method=RequestMethod.POST)
	public ModelAndView writeForm_step3(HttpServletRequest req, @ModelAttribute MusicboardVO bdto) throws Exception{

		if(bdto.getMusicboard_imgname().equals("") || bdto.getMusicboard_imgname()==null) {
			bdto.setMusicboard_imgname("null");
		}
		
		musicboardService.insertMusicBoard(bdto);
		
		
		
		MusicboardVO bdto1 = musicboardService.getMusicBoarddto(bdto);

		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		ArrayList<String> filename = new ArrayList<String>();

		Iterator<String> files = mr.getFileNames();

		while(files.hasNext()){
			String name = files.next();
			filename.add(mr.getFile(name).getName());
		}
		
		MusicVO dto = new MusicVO();
		int i=0;
		for (String tmp : filename) {

			String root = mr.getSession().getServletContext().getRealPath("/");
			String uploadPath = root+"resources/mp3/";
			
			File dir = new File(uploadPath);
			if(!dir.isDirectory()){
				dir.mkdir();
			}


			MultipartFile imagefile = mr.getFile(tmp);


			dto.setMusic_musicboardno(bdto1.getMusicboard_no());
			dto.setMusic_musicboardname(bdto1.getMusicboard_name());
			dto.setMusic_artistname(bdto1.getMusicboard_artistname());

			File atarget = new File(uploadPath, imagefile.getOriginalFilename());
			
			if (imagefile.getSize()>0) {
				imagefile.transferTo(atarget);
				String music_filename = imagefile.getOriginalFilename();
				dto.setMusic_filename(music_filename);

			}

			String mvlink = null;
			mvlink = mr.getParameter("mvlink"+i);
			
			String music_name = mr.getParameter("music_name"+i);

			dto.setMusic_name(music_name);

			if(mvlink.contains("v=")) {
				int start = mvlink.indexOf("v="); 
				String parseText = mvlink.substring(start+2);
				dto.setMusic_mvlink(parseText);
			}else {
				dto.setMusic_mvlink(mvlink);
			}

			musicboardService.insertMusic(dto);
			i++;
		
		}

		List<MusicVO> list = musicboardService.getMusic(bdto1);
		ModelAndView mav = new ModelAndView();

		int b = 1;
		for (MusicVO tmp : list) {
			b++;
		}
		
		mav.addObject("mdto", list);
		mav.addObject("bdto", bdto1);
		mav.setViewName("album/writeForm_step3");
		return mav;

	}

	@RequestMapping(value="/writeForm_step1", method=RequestMethod.GET)
	public String writeBoard(HttpServletRequest req) throws Exception {
		return "album/writeForm_step1";
	}

	@RequestMapping(value="/writeForm_step3", method=RequestMethod.GET)
	public String writeBoard3(HttpServletRequest req) throws Exception {
		return "album/writeForm_step3";
	}

	@RequestMapping(value="/album_view" , method=RequestMethod.GET)
	public ModelAndView album_view(HttpServletRequest req) throws Exception {
		int musicboard_no = Integer.parseInt(req.getParameter("no"));
		MusicboardVO bdto = musicboardService.getMusicboard(musicboard_no);
		List<MusicVO> mlist = musicboardService.getMusics(musicboard_no);

		ModelAndView mav = new ModelAndView();
		LikeVO ldto = new LikeVO();
		String userid =(String)req.getSession().getAttribute("userid");
		if(userid==null) {
			mav.addObject("album_like_ch", 2);
		}else {
			ldto.setLike_music_boardno(musicboard_no);
			ldto.setLike_music_userid(userid);

			int album_like_ch = likeService.like_isalbum(ldto);
			mav.addObject("album_like_ch", album_like_ch);
		}

		int likecount = likeService.like_getalbumCount(musicboard_no);

		mav.setViewName("album/getAlbum");
		mav.addObject("likecount", likecount);
		mav.addObject("bdto", bdto);
		mav.addObject("mlist", mlist);
		return mav;
	}
	@RequestMapping(value="/album_del" , method=RequestMethod.POST)
	public @ResponseBody int album_del(HttpServletRequest req) throws Exception {
		String musicboard_no =req.getParameter("musicboard_no");
		int res = musicboardService.musicboard_del(Integer.parseInt(musicboard_no));
		return res;
	}
	@RequestMapping(value="/music_del" , method=RequestMethod.POST)
	public @ResponseBody int music_del(HttpServletRequest req) throws Exception {
		String music_no =req.getParameter("music_no");
		int res = musicboardService.music_del(Integer.parseInt(music_no));
		return res;
	}
}