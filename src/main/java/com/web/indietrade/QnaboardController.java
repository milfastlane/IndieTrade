package com.web.indietrade;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.QnAboardVO;
import com.web.model.ReplyVO;
import com.web.model.UserVO;
import com.web.service.LogService;
import com.web.service.QnaboardService;
import com.web.service.ReplyService;

@Controller
public class QnaboardController {
	
	@Autowired
	private QnaboardService qnaboardService;
	
	@Autowired
	private LogService logService;
	
	@Autowired
	private ReplyService replyService;
	

	@RequestMapping(value = "/faqmain", method = RequestMethod.GET)
	public ModelAndView faqmain() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("support/faqmain");
		return mav;
	}
	
	@RequestMapping(value = "/qnamain", method = RequestMethod.GET)
	public ModelAndView qnamain(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = qnaboardService.getCount();

		if(endRow>count) {endRow=count;}
		List<UserVO> list = null;
		list = (List<UserVO>) qnaboardService.getAllQnaBoard(startRow,endRow);

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
		
		mav.addObject("qnaboardlist", list);
		mav.addObject("count", count);
		
		mav.setViewName("support/qnamain");
		return mav;
	}
	
	@RequestMapping(value="/qnaboard_search", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam Map<String,String> requestParams, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		String searchOption = requestParams.get("searchOption");
		String searchString = requestParams.get("searchString");
		
		if(searchString=="") {
			searchOption = null;	
		}
		
		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		
		int count = 0;
		if(searchOption!=null && searchString==null) {
			count = qnaboardService.getCount();
		}else {
			count = qnaboardService.getCountByCondition(searchOption, searchString);
		}
		
		if(endRow>count) {
			endRow=count;
		}
				
		List<UserVO> list = null;
		list = (List<UserVO>) qnaboardService.search(searchOption, searchString, startRow, endRow);

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
		
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchString", searchString);
		
		mav.addObject("qnaboardlist", list);
		mav.addObject("count", count);
		
		mav.setViewName("support/qnaboard_search");
		return mav;
	}
	
	@RequestMapping(value = "/qnaboard_write", method = RequestMethod.GET)
	public ModelAndView qnaboard_write(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
	
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("authuser");
		
		UserVO dto = logService.getMember_login_id(id);
		mav.addObject("dto", dto);
		
		mav.setViewName("support/qnaboard_write");
		return mav;
	}
	
	@RequestMapping(value = "/qnaboard_write", method = RequestMethod.POST)
	public ModelAndView qnaboard_writePro(HttpServletRequest req, @ModelAttribute QnAboardVO dto) {
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("authuser");
		
		UserVO _dto = logService.getMember_login_id(id);
		dto.setQnaboard_writer(_dto.getUser_id());

		int res = qnaboardService.insertQnaBoard(dto);
	
		return new ModelAndView("redirect:qnamain");
	}

	
	@RequestMapping(value="/qnaboard_content")
	public String content(HttpServletRequest req) {
		int res = qnaboardService.readCount(Integer.parseInt(req.getParameter("qnaboard_no")));
	
		QnAboardVO dto = qnaboardService.getQnaBoard(Integer.parseInt(req.getParameter("qnaboard_no")));
		req.setAttribute("getQnaBoard", dto);
		return "support/qnaboard_content";
	}
	
	@RequestMapping(value="/qnaboard_delete", method=RequestMethod.GET)
	public String deleteForm() {
		return "support/qnaboard_delete";
	}
	
	@RequestMapping(value="/qnaboard_delete", method=RequestMethod.POST)
	public ModelAndView deletePro(@RequestParam String qnaboard_no, @RequestParam String passwd) {
		boolean isPass = qnaboardService.isPasswordCorrect(Integer.parseInt(qnaboard_no), passwd);
		if (isPass) {
			int res = qnaboardService.deleteQnaBoard(Integer.parseInt(qnaboard_no));
		}
		return new ModelAndView("redirect:qnamain");
	}
	
	@RequestMapping(value="/qnaboard_update", method=RequestMethod.GET)
	public String updateForm(HttpServletRequest req, @RequestParam int qnaboard_no) {
		QnAboardVO dto = qnaboardService.getQnaBoard(qnaboard_no);
		req.setAttribute("getQnaBoard", dto);
		return "support/qnaboard_update";
	}
	
	@RequestMapping(value="/qnaboard_update", method=RequestMethod.POST)
	public @ResponseBody int abc_abc(HttpServletRequest req) {
		String qnaboard_title = req.getParameter("qnaboard_title");
		String qnaboard_content = req.getParameter("qnaboard_content");
		String qnaboard_passwd = req.getParameter("qnaboard_passwd");
		int qnaboard_no = Integer.parseInt(req.getParameter("qnaboard_no"));

		QnAboardVO dto = qnaboardService.getQnaBoard(qnaboard_no);
		dto.setQnaboard_title(qnaboard_title);
		dto.setQnaboard_content(qnaboard_content);
		dto.setQnaboard_passwd(qnaboard_passwd);
		
		boolean isPass = qnaboardService.isPasswordCorrect(qnaboard_no, dto.getQnaboard_passwd());
		int res = 0;
		if (isPass) {
			res = qnaboardService.updateQnaBoard(dto);
		}
		
		return res;
	}
	
	
    @RequestMapping("insert_reply")
    public @ResponseBody int insertReply(@ModelAttribute ReplyVO dto, HttpSession session){
        String userId = (String) session.getAttribute("userid");
        
        dto.setReply_writer(userId);
        
        qnaboardService.updateRecnt(dto.getQnaboard_no());
        
        return replyService.insertReply(dto);

    }
    
    @RequestMapping("delete_reply")
    public @ResponseBody int deleteReply(@RequestParam int reply_no, @RequestParam int qnaboard_no, HttpSession session){
       
    	qnaboardService.DeupdateRecnt(qnaboard_no);
        
        return replyService.deleteReply(reply_no);
    }
    
   
    @RequestMapping("list_replies")
    @ResponseBody 
    public List<ReplyVO> listReplies(@RequestParam int qnaboard_no){
    	
        List<ReplyVO> list = replyService.listReplies(qnaboard_no);
  
        return list;
    }
    
}
