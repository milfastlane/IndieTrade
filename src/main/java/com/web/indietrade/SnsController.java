package com.web.indietrade;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.LikeVO;
import com.web.model.SnsboardVO;
import com.web.model.SnspageVO;
import com.web.model.UserVO;
import com.web.service.LikeService;
import com.web.service.LogService;
import com.web.service.SnsService;
import com.web.service.SnsboardService;

@Controller
public class SnsController {

	@Autowired
	private SnsService snsService;

	@Autowired
	private SnsboardService snsboardService;

	@Autowired
	private LogService logService;
	
	@Autowired
	private LikeService likeService;

	@RequestMapping(value="/snspage_main")
	public ModelAndView snspage_main(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = snsService.snspage_getCount();
		if(endRow>count) {endRow=count;}
		List<SnspageVO> list = null;
		list = (List<SnspageVO>) snsService.getallsnspage(startRow,endRow);

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
		
		mav.setViewName("snspage/snspagemain");
		mav.addObject("snspagelist", list);
		return mav;
	}

	@RequestMapping(value="/sns" ,method = RequestMethod.GET)
	public ModelAndView sns(HttpServletRequest req , HttpServletResponse resp, Locale locale) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String name = req.getParameter("name");
		String artist_no = null;
		
		if(req.getParameter("artist_no") != null) {
			artist_no = req.getParameter("artist_no");
			UserVO userdto = null;
			userdto = logService.getMember_no(Integer.parseInt(artist_no));
			name = userdto.getUser_id();
		}
		
		String userid = "";
		if(name.equals("") || name==null) {
			return new ModelAndView("redirect:snspage_main");
		}

		if((String) req.getSession().getAttribute("userid")!=null) {
			userid = (String) req.getSession().getAttribute("userid");
			UserVO userdto = null;
			userdto = logService.getMember_username(userid);
			mav.addObject("userdto" ,userdto);
		}
		SnspageVO dto = null;
		dto = snsService.getsnspage(name);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		
		LikeVO ldto = new LikeVO();
		if(userid==null||userid.equals("")) {
			mav.addObject("snspage_like_ch", 2);
		}else {
			ldto.setLike_sns_userid(userid);
			ldto.setLike_sns_artistid(name);
			
			int snspage_like_ch = likeService.like_issnspage(ldto);
			mav.addObject("snspage_like_ch", snspage_like_ch);
		}
		
		int likecount = likeService.like_getsnspageCount(name);
		
		
		req.setAttribute("serverTime", formattedDate );
		mav.setViewName("snspage/snsPageView");

		List<SnsboardVO> list = null;
		
		list = snsboardService.getallboard(name);
		mav.addObject("likecount", likecount);
		mav.addObject("getsnsdto", dto);
		mav.addObject("snslist", list);

		return mav;
	}

	@Secured("ROLE_ARTIST")
	@RequestMapping(value="/sns_update" ,method = RequestMethod.GET)
	public ModelAndView update(HttpServletRequest req , HttpServletResponse resp,Locale locale) throws Exception {
		
		String name =req.getParameter("name");
		String user_id = (String) req.getSession().getAttribute("userid");
		if(!(name.equals(user_id)))return new ModelAndView("redirect:/");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		
		SnspageVO dto = null;
		dto = snsService.getsnspage(name);
		
		List<SnsboardVO> list = null;
		list = snsboardService.getallboard(name);
		ModelAndView mav = new ModelAndView();
		
		req.setAttribute("serverTime", formattedDate );
		mav.setViewName("snspage/snsPageViewUpdate");
		mav.addObject("snsdto", dto);
		mav.addObject("snsboardlist", list);
		return mav;
	}

	@RequestMapping(value="/sns_update" ,method = RequestMethod.POST)
	public @ResponseBody int updatePro(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		String name = req.getParameter("name");
		UserVO userdto = logService.getMember_login_id(name);
		
		if(name.equals("")||name==null) {
			return 0;
		}
		SnspageVO dto = null;
		dto = snsService.getsnspage(name);
		
		if(dto!=null) {
			return 2;
		}
		if(userdto.getUser_authority().equals("admin") || userdto.getUser_authority().equals("artist")) {
			
			UserVO udto=logService.getMember_login_id(name);
			if(udto.getUser_filename()==null)udto.setUser_filename("null");
			int res=snsService.insertsnspage(udto);
				
			return res;
			
		}
		return 0;
	}
	
	@RequestMapping(value="/sns_snspage_pageproimgnameUp", method=RequestMethod.POST)
	public @ResponseBody int snspage_pageproimgnameUp(HttpServletRequest arg0,MultipartHttpServletRequest multi) throws Exception{
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root+"resources/userproimg/";
		
		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}

		Iterator<String> files = multi.getFileNames();
		String uploadFile = files.next();
		MultipartFile mFile = multi.getFile(uploadFile);
		String fileName = mFile.getOriginalFilename();

		try {
			mFile.transferTo(new File(path+fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}

		SnspageVO dto = new SnspageVO();
		int user_no = Integer.parseInt(arg0.getParameter("user_no"));
		dto.setUser_no(user_no);
		dto.setSnspage_profileimgname(fileName);
		int res = snsService.snspage_pageproimgnameUp(dto);
		return res;
	}
	
	@RequestMapping(value="/sns_snspage_pagemainimgnameUp", method=RequestMethod.POST)
	public @ResponseBody int snspage_pagemainimgnameUp(HttpServletRequest arg0,MultipartHttpServletRequest multi) throws Exception{
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root+"resources/userproimg/";
		
		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}

		Iterator<String> files = multi.getFileNames();
		String uploadFile = files.next();
		MultipartFile mFile = multi.getFile(uploadFile);
		String fileName = mFile.getOriginalFilename();

		try {
			mFile.transferTo(new File(path+fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}

		SnspageVO dto2 = new SnspageVO();
		int user_no = Integer.parseInt(arg0.getParameter("user_no"));
		dto2.setUser_no(user_no);
		dto2.setSnspage_mainimgname(fileName);
		int res = snsService.snspage_pagemainimgnameUp(dto2);
		return res;

	}

	@RequestMapping(value="/sns_snspage_pagenameUp", method=RequestMethod.POST)
	public @ResponseBody int sns_snspage_pagenameUp(HttpServletRequest arg0) throws Exception{
		String pagename = arg0.getParameter("pagename");

		SnspageVO dto = new SnspageVO();
		int user_no = Integer.parseInt(arg0.getParameter("user_no"));
		dto.setUser_no(user_no);
		dto.setSnspage_name(pagename);
		int res = snsService.snspage_pagenameUp(dto);
		return res;
	}
	
	@RequestMapping(value="/sns_snspage_pageprocontent", method=RequestMethod.POST)
	public @ResponseBody int sns_snspage_pageprocontent(HttpServletRequest arg0) throws Exception{
		String pagecontent = arg0.getParameter("pagecontent");
		
		SnspageVO dto = new SnspageVO();
		int user_no = Integer.parseInt(arg0.getParameter("user_no"));
		dto.setUser_no(user_no);
		dto.setSnspage_content(pagecontent);
		int res = snsService.sns_snspage_pageprocontent(dto);
		return res;
	}
	
	@RequestMapping(value="/sns_snspagecontent_del", method=RequestMethod.POST)
	public @ResponseBody int sns_snspagecontent_del(HttpServletRequest arg0) throws Exception{
		String contentno = arg0.getParameter("contentno");
		String page_id = arg0.getParameter("page_id");
		SnsboardVO bbdto = new SnsboardVO();
		bbdto.setSnsboard_contentno(Integer.parseInt(contentno));
		bbdto.setSnsboard_artistid(page_id);
		int res = snsboardService.snsboard_del(bbdto);
		return res;
	}

	@RequestMapping(value="/sns_snspage_pagecontentUp", method=RequestMethod.POST)
	public @ResponseBody int sns_snspage_pagecontentUp(HttpServletRequest arg0 , Locale locale) throws Exception{
		String user_id = arg0.getParameter("user_id");
		String page_id = arg0.getParameter("page_id");
		String board_content = arg0.getParameter("board_content");
		UserVO userdto = null;
		userdto = logService.getMember_login_id(user_id);
		SnsboardVO bbdto = new SnsboardVO();

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);

		int contentNo = snsboardService.getboardno(page_id);

		bbdto.setSnsboard_loginid(user_id);

		if(userdto.getUser_filename()==null || userdto.getUser_filename().equals("")) {
			bbdto.setSnsboard_loginidimg("null");
		}else {
			bbdto.setSnsboard_loginidimg(userdto.getUser_filename());
		}
		bbdto.setSnsboard_loginid(user_id);
		bbdto.setSnsboard_artistid(page_id);
		bbdto.setSnsboard_content(board_content);
		bbdto.setSnsboard_contenttime(formattedDate);
		bbdto.setSnsboard_loginip(arg0.getRemoteAddr());
		bbdto.setSnsboard_contentno(contentNo+1);
		bbdto.setSnsboard_loginname(userdto.getUser_name());
		int res = snsboardService.inputboard(bbdto);
		return res;
	}
	
	@RequestMapping(value="/snspage_del", method=RequestMethod.POST)
	public @ResponseBody int snspage_del(HttpServletRequest req) throws Exception{
		String user_no = req.getParameter("user_no");
		
		
		int res = snsService.snspage_del(Integer.parseInt(user_no));
		return res;
	}
	
}
