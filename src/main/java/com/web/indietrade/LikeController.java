package com.web.indietrade;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.LikeVO;
import com.web.model.MusicboardVO;
import com.web.model.SnspageVO;
import com.web.service.LikeService;
import com.web.service.MusicboardService;
import com.web.service.SnsService;

@Controller
public class LikeController {

	@Autowired
	private LikeService likeService;

	@Autowired
	private MusicboardService musicboardService;

	@Autowired
	private SnsService snsService;

	@RequestMapping(value = "/albumDown", method = RequestMethod.POST)
	public @ResponseBody int albumDown(HttpServletRequest req) {
		String like_music_userid =	req.getParameter("like_music_userid");
		String like_music_boardno =	req.getParameter("like_music_boardno");

		LikeVO dto =  new LikeVO();
		dto.setLike_music_boardno(Integer.parseInt(like_music_boardno));
		dto.setLike_music_userid(like_music_userid);
		int res = likeService.like_albumDown(dto);

		return res;
	}

	@RequestMapping(value = "/albumUp", method = RequestMethod.POST)
	public @ResponseBody int albumUp(HttpServletRequest req) {
		String like_music_userid =	req.getParameter("like_music_userid");
		String like_music_boardno =	req.getParameter("like_music_boardno");

		LikeVO dto =  new LikeVO();
		dto.setLike_music_boardno(Integer.parseInt(like_music_boardno));
		dto.setLike_music_userid(like_music_userid);
		int res = likeService.like_albumUp(dto);

		return res;
	}


	@RequestMapping(value = "/snspageUp", method = RequestMethod.POST)
	public @ResponseBody int snspageUp(HttpServletRequest req) {
		String like_sns_artistid =	req.getParameter("like_sns_artistid");
		String like_sns_userid =	req.getParameter("like_sns_userid");
		LikeVO dto =  new LikeVO();
		dto.setLike_sns_artistid(like_sns_artistid);
		dto.setLike_sns_userid(like_sns_userid);
		int res = likeService.like_snspageUp(dto);

		return res;
	}
	@RequestMapping(value = "/snspageDown", method = RequestMethod.POST)
	public @ResponseBody int snspageDown(HttpServletRequest req) {
		String like_sns_artistid =	req.getParameter("like_sns_artistid");
		String like_sns_userid =	req.getParameter("like_sns_userid");
		LikeVO dto =  new LikeVO();
		dto.setLike_sns_artistid(like_sns_artistid);
		dto.setLike_sns_userid(like_sns_userid);
		int res = likeService.like_snspageDown(dto);

		return res;


	}
	
	@RequestMapping(value = "/like_mylist")
	public ModelAndView like_mylist(HttpServletRequest req, @RequestParam(value = "user_id" , required = false) String user_id) {
		
		ModelAndView mav = new ModelAndView();
		
		
		List<LikeVO> likelist = null;
		
		MusicboardVO mbdto = new MusicboardVO();
		likelist = likeService.mylikelist(user_id);
		
		ArrayList<SnspageVO> mysns = null;
		ArrayList<MusicboardVO> myalbum = null;
		
		
		
		
		if(likelist.size() == 0) {
			mav.addObject("likelist", 0);
		}else {
			mysns = new ArrayList<SnspageVO>();
			myalbum = new ArrayList<MusicboardVO>();
			
			for (LikeVO tmp : likelist) {
				if(tmp.getLike_music_boardno() != 0 ) {
					System.out.println("tmp.getLike_music_boardno is : " + tmp.getLike_music_boardno());
					mbdto = musicboardService.getMusicboardlike(tmp.getLike_music_boardno());
					myalbum.add(mbdto);
				}else {
					mysns.add(snsService.getsnspage(tmp.getLike_sns_artistid()));
				}
			}
			mav.addObject("mysns", mysns);
			mav.addObject("myalbum", myalbum);
		}

		mav.setViewName("log/user_likelist");
		return mav;
	}
	
}