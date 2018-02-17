package com.web.indietrade;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.BuskingVO;
import com.web.service.BuskingService;

@Controller
public class BuskingController {
	@Autowired
	public BuskingService buskingService;

	@RequestMapping(value="/busking_main" ,method=RequestMethod.GET)
	public ModelAndView busking_main(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		List<BuskingVO> list = buskingService.listBusking();
		ModelAndView mav = new ModelAndView();
		mav.addObject("buskingList", list);
		mav.setViewName("busking/buskingmain");
		return mav;
	}

	@RequestMapping(value="/busking_mylist")
	public ModelAndView buskingPersonalForm(HttpServletRequest req) throws Exception {
		String busking_userid = req.getParameter("busking_userid");
		List<BuskingVO> list = buskingService.listMyBusking(busking_userid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("buskingMyList", list);
		mav.setViewName("busking/buskingMyList");
		return mav;
	}
	

	@RequestMapping(value="/busking_edit" ,method=RequestMethod.GET)
	public ModelAndView buskingEditnPro(HttpServletRequest req, @RequestParam String busking_no) throws Exception {
		int snum = Integer.parseInt(busking_no);
		BuskingVO dto = buskingService.getBusking(snum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("getBusking", dto);
		mav.setViewName("busking/buskingedit");
		return mav;
	}
	
	@RequestMapping(value="/busking_edit", method=RequestMethod.POST)
	protected ModelAndView BuskingEditPro(HttpServletRequest req, @ModelAttribute BuskingVO dto, 
			BindingResult result)throws Exception {
		
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req; 
			MultipartFile mf = mr.getFile("file");
			String poster = "";
			if(mf.getOriginalFilename()==null||mf.getOriginalFilename().equals("")) {
				poster = dto.getBusking_poster();
			}else {
				String root = mr.getSession().getServletContext().getRealPath("/");
				String path = root+"resources/buskingimg/";
				
				poster = mf.getOriginalFilename();
				File file = new File(path, poster);
				mf.transferTo(file);
				dto.setBusking_poster(poster);
			}

		buskingService.editBusking(dto);
		
		ModelAndView mav = new ModelAndView();
		
		String ret = "redirect:busking_mylist?busking_userid="+req.getSession().getAttribute("userid");
		mav.setViewName(ret);
		return mav;
}

	@RequestMapping(value="/busking_view")
	public ModelAndView busking_view(HttpServletRequest req, @RequestParam String busking_no) throws Exception {
		int snum = Integer.parseInt(busking_no);
		BuskingVO dto = buskingService.getBusking(snum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("getBusking", dto);
		mav.setViewName("busking/buskingview");
		return mav;
	}

	@RequestMapping(value="/busking_insert", method=RequestMethod.GET)
	public String buskingInsertForm() throws Exception {
		return "busking/buskingInsert";
	}

	@RequestMapping(value="/busking_insert", method=RequestMethod.POST)
	public ModelAndView buskingInsertPro(HttpServletRequest arg0,
			@ModelAttribute BuskingVO dto, BindingResult result) throws Exception {

		String poster = "";
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)arg0;
		MultipartFile posterfile = mr.getFile("file");
		String root = mr.getSession().getServletContext().getRealPath("/");
		String path = root+"resources/buskingimg/";

		File target = new File(path, posterfile.getOriginalFilename());
		if (posterfile.getSize()>0) {
			posterfile.transferTo(target);
			poster = posterfile.getOriginalFilename();
		}
		dto.setBusking_poster(poster);
		int res = buskingService.insertBusking(dto);
		return new ModelAndView("redirect:busking_main");
	}


	@RequestMapping(value="/busking_delete")
	public ModelAndView buskingdeletePro(@RequestParam String busking_no) {
		
		buskingService.deleteBusking(Integer.parseInt(busking_no));
		return new ModelAndView("redirect:busking_admin");
	}
	@RequestMapping(value="/busking_delete_artist")
	public ModelAndView busking_delete_artist(@RequestParam String busking_no ,HttpServletRequest req) {
		
		buskingService.deleteBusking(Integer.parseInt(busking_no));
		String ret = "redirect:busking_mylist?busking_userid="+req.getSession().getAttribute("userid");
		return new ModelAndView(ret);
	}
}


