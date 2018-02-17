package com.web.indietrade;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.CategoryVO;
import com.web.model.MusicboardVO;
import com.web.model.NoticeboardVO;
import com.web.service.AdminService;
import com.web.service.MusicboardService;
import com.web.service.NoticeboardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BaseController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private NoticeboardService noticeboardService;
	
	@Autowired
	private MusicboardService musicboardService;
	
	private String path = "error";
	
	private static final Logger logger = LoggerFactory.getLogger(BaseController.class);
	 
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main(Locale locale,HttpSession session, HttpServletRequest req) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<MusicboardVO> list = musicboardService.allMusicBoard();
	
		List<CategoryVO> clist = adminService.listCategory();

		ArrayList<String> aclist = new ArrayList<String>();

		for (CategoryVO tmp : clist) {
			if(aclist==null || aclist.size()==0) {
				aclist.add(tmp.getCategory_major()); 
			}
			
			for (int i = 0; i < aclist.size(); i++) {
				if(!(aclist.get(i).equals(tmp.getCategory_major()))) {
					aclist.add(tmp.getCategory_major());
				}
			}
		}
		
		for (int i = 1; i < aclist.size(); i++) {
			if(aclist.get(i).equals(aclist.get(i-1))){
				aclist.remove(i);
				i=1;
			}
		}

		Collections.reverse(aclist);

		ModelAndView mav = new ModelAndView();
		session.setAttribute("clist", clist);
		session.setAttribute("aclist", aclist);
		mav.addObject("boardList", list);
		
		NoticeboardVO representNotice = noticeboardService.getRepresentingNoticeBoard();
		mav.addObject("representNotice", representNotice);	
		
		mav.setViewName("mainindex");
		return mav;
	}

	
	@RequestMapping(value = "/400") 
	public String error_400() { 
		return path + "/400";  
	}
	@RequestMapping(value = "/404") 
	public String error_404() { 
		return path + "/404";  
	}
	@RequestMapping(value = "/500") 
	public String error_500() { 
		return path + "/500";  
	}
	
}
