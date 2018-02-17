package com.web.indietrade;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.BuskingVO;
import com.web.model.CategoryVO;
import com.web.model.MessageVO;
import com.web.model.MusicboardVO;
import com.web.model.NoticeboardVO;
import com.web.model.SnsboardVO;
import com.web.model.UserVO;
import com.web.service.AdminService;
import com.web.service.BuskingService;
import com.web.service.LogService;
import com.web.service.MessageService;
import com.web.service.NoticeboardService;
import com.web.service.SnsService;
import com.web.service.SnsboardService;

@Secured("ROLE_ADMIN")
@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private NoticeboardService noticeboardService;

	@Autowired
	private MessageService messageService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private SnsService snsService;

	@Autowired
	private BuskingService buskingService;
	
	@Autowired
	private SnsboardService snsboardService;
	
	@Autowired
	private LogService logService;
	
	//Admin main
	@RequestMapping(value="/admin_main")
	public ModelAndView indexAdmin(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();

		int usersTotal = adminService.countUsers(); 
		int musicsTotal = adminService.countMusics(); 
		mav.addObject("usersTotal", usersTotal); 
		mav.addObject("musicsTotal", musicsTotal); 

		List<UserVO> userList = adminService.listUser(); 
		List<MusicboardVO> musicboardList = adminService.musicboardList(); 
		mav.addObject("musicboardList", musicboardList);
		mav.addObject("userList", userList);

		mav.setViewName("admin/main");
		return mav;
	}
	
	//Categories
	@RequestMapping(value="/admin_category_index")
	public String indexAdmin_Category() throws Exception {
		return "admin/category/index";
	}

	@RequestMapping(value="/admin_insertCategory", method=RequestMethod.GET)
	public String insertCategory() throws Exception {
		return "admin/category/insert_category";
	}

	@RequestMapping(value="/admin_insertCategory", method=RequestMethod.POST)
	public ModelAndView insertProCategory(HttpServletRequest arg0, @ModelAttribute CategoryVO dto) throws Exception {
		//int res = adminService.insertCategory(dto);          
		adminService.insertCategory(dto);
		return new ModelAndView("redirect:admin_listCategory");
	}

	@RequestMapping(value="/admin_listCategory")
	public ModelAndView listCategory(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;

		int count = 0;
		count = adminService.getCount_category();

		if(endRow>count) {
			endRow=count;
		}

		List<CategoryVO> list = null;
		list = adminService.listCategory();

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
		
		mav.addObject("categoryList", list);
		mav.addObject("count", count);

		mav.setViewName("admin/category/list_category");

		return mav;
	}

	@RequestMapping(value="/admin_updateCategory", method=RequestMethod.GET)
	public ModelAndView updateCategory(HttpServletRequest arg0, @RequestParam String num, HttpServletResponse arg1) throws Exception {
		int snum = Integer.parseInt(num);
		CategoryVO dto = adminService.getCategory(snum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("getCategory", dto);
		mav.setViewName("admin/category/edit_category");
		return mav;    
	}

	@RequestMapping(value="/admin_updateCategory", method=RequestMethod.POST)
	public ModelAndView updateProCategory(HttpServletRequest arg0, @ModelAttribute CategoryVO cdto) throws Exception {
		//int res = adminService.updateCategory(cdto); 
		adminService.updateCategory(cdto);
		return new ModelAndView("redirect:admin_listCategory");
	}

	@RequestMapping(value="/admin_deleteCategory")
	public ModelAndView deleteCategory(@RequestParam String num) throws Exception {
		
		adminService.deleteCategory(Integer.parseInt(num));
		return new ModelAndView("redirect:admin_listCategory");
	}

	
	
	
	//Member
	@RequestMapping(value="/admin_memberAll")
	public ModelAndView memberAll(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = adminService.getCount();

		if(endRow>count) {endRow=count;}
		List<UserVO> list = null;
		list = (List<UserVO>) adminService.getAllMember(startRow,endRow);

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

		mav.addObject("userAllList", list);

		mav.setViewName("admin/member/memberAll");
		return mav;
	}
	
	@RequestMapping(value="/admin_membersearch", method=RequestMethod.GET)
	public ModelAndView search(@RequestParam Map<String,String> requestParams, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		String searchOption = requestParams.get("searchOption");
		String searchString = requestParams.get("searchString");

		if(searchString.equals("")) {
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
		
		if(searchOption==null && searchString.equals("")) {
			count = adminService.getCount();
		}else if(searchOption.equals("name") && !searchString.equals("")) {
			count = adminService.getCountByCond(searchOption, searchString);
		}else if(searchOption.equals("id") && !searchString.equals("")) {
			count = adminService.getCountByCond(searchOption, searchString);
		}

		if(endRow>count) {
			endRow=count;
		}

		List<UserVO> list = null;
		list = (List<UserVO>) adminService.membersearch(searchOption, searchString, startRow, endRow);

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

		mav.addObject("userAllList", list);
		mav.addObject("count", count);

		mav.setViewName("admin/member/member_search");
		return mav;

	}
	
	@RequestMapping(value="/admin_terminate")
	public ModelAndView userterminate(@RequestParam int user_no) throws Exception {
		
		snsService.snspage_del(user_no);

		UserVO vo = logService.getMember_no(user_no);
		if(vo.getUser_authority().equals("artist")) {
			SnsboardVO sbvo = snsboardService.getboard(vo.getUser_id());
			if(sbvo!=null) {
				snsboardService.snsboard_del(sbvo);
			}
	    }

		adminService.terminateuser(user_no);
		
		return new ModelAndView("redirect:admin_memberAll"); 
	}
	
	@RequestMapping(value="/admin_memberAll_artist")
	public ModelAndView memberAll_artist(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = adminService.getCount_artist();

		if(endRow>count) {endRow=count;}
		List<UserVO> list = null;
		list = (List<UserVO>) adminService.getAllArtist(startRow,endRow);

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

		mav.addObject("userAllArtist", list);

		mav.setViewName("admin/member/memberAll_artist");
		return mav;
	}

	@RequestMapping(value="/admin_memberAll_fan")
	public ModelAndView memberAll_fan(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();

		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = adminService.getCount_fan();

		if(endRow>count) {
			endRow=count;
		}
		
		List<UserVO> list = null;
		list = (List<UserVO>) adminService.getAllFan(startRow,endRow);

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

		mav.addObject("userAllfan", list);

		mav.setViewName("admin/member/memberAll_fan");

		return mav;
	}
	
	@RequestMapping(value="/admin_unregisteredAll")
	public ModelAndView unregisteredAll(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();

		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = adminService.getCount2();

		if(endRow>count) {endRow=count;}
		List<UserVO> list = null;
		list = (List<UserVO>) adminService.getAllUnregistered(startRow,endRow);

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

		mav.addObject("unregisteredAllList", list);

		mav.setViewName("admin/member/unregisteredAll");
		return mav;
	}
	
	@RequestMapping(value="/admin_unregisteredsearch", method=RequestMethod.GET)
	public ModelAndView search_unregistered(@RequestParam(value = "searchString" , required = false) String searchString, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;

		int count = 0;
		if(searchString.equals("")) {
			count = adminService.getCount2();
		}else if(!searchString.equals("")) {	
			count = adminService.getCountByCond2(searchString);
		}

		if(endRow>count) {
			endRow=count;
		}

		List<UserVO> list = null;
		list = (List<UserVO>) adminService.unregisteredsearch(searchString, startRow, endRow);

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

		mav.addObject("searchString", searchString);

		mav.addObject("unregisteredAllList", list);
		mav.addObject("count", count);

		mav.setViewName("admin/member/unregistered_search");
		return mav;
	}

	
	//Message
	@RequestMapping(value="/admin_messagebox")
	public ModelAndView messageBox() throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/message/messagebox");
		return mav;
	}

	@RequestMapping(value="/admin_messageindividual")
	public ModelAndView messageIndividual() throws Exception {
		ModelAndView mav = new ModelAndView();

		List<UserVO> usernamelist = adminService.listUsername();

		mav.addObject("usernamelist", usernamelist);

		mav.setViewName("admin/message/messageindividual");
		return mav;
	}
	
	@RequestMapping(value = "/admin_messagewrite", method = RequestMethod.POST)
	public ModelAndView message_writePro(HttpServletRequest req, @ModelAttribute MessageVO dto) {
		
		HttpSession session = req.getSession();
		String adminId = (String) session.getAttribute("userid");

		if(req.getParameter("from").equals("admin")) {
			dto.setMessage_receiverid("all");
			dto.setMessage_senderid(adminId);
		}else if(req.getParameter("from").equals("adminindividual")){
			dto.setMessage_receiverid(req.getParameter("user_id")); //user_id
			dto.setMessage_senderid(adminId);
		}

		messageService.insertMessage(dto);
		
		return new ModelAndView("redirect:admin_messagesent");
	}
	
	@RequestMapping(value="/admin_messagecontent")
	public ModelAndView messageContent(HttpServletRequest req, @RequestParam int message_no) throws Exception {
		ModelAndView mav = new ModelAndView();

		messageService.updateMessageRead(message_no);

		MessageVO dto = messageService.getMessage(message_no);
		mav.addObject("messageinfo", dto);

		mav.setViewName("admin/message/messagecontent");
		return mav;
	}
	
	@RequestMapping(value="/admin_messagereceived")
	public ModelAndView messageReceived(HttpSession session, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();

		String adminid = (String)session.getAttribute("userid");

		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = messageService.getCount_receivedlistfromuser(adminid);

		if(endRow>count) {
			endRow=count;
		}
		List<MessageVO> receivedlistfromuser = null;
		receivedlistfromuser = messageService.receivedlistfromuser(adminid, startRow, endRow);

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

		mav.addObject("count", count);
		mav.addObject("receivedlistfromuser", receivedlistfromuser);

		mav.setViewName("admin/message/messagereceived");
		return mav;
	}
	
	@RequestMapping(value="/admin_receivedmessagesearch", method=RequestMethod.GET)
	public ModelAndView search_receivedmessage(@RequestParam(value = "searchString" , required = false) String searchString, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = req.getSession();

		String adminid = (String)session.getAttribute("userid");
	
		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;

		int count = 0;

		if(searchString.equals("")) {
			count = messageService.getCount_receivedlistfromuser(adminid);
		}else if(!searchString.equals("")) {
			count = messageService.getCount_receivedlistfromuser_byCond(adminid, searchString);
		}

		if(endRow>count) {
			endRow=count;
		}

		List<UserVO> list = null;
		list = (List<UserVO>) adminService.receivedmessagesearch(adminid, searchString, startRow, endRow);

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

		mav.addObject("searchString", searchString);

		mav.addObject("receivedlistfromuser", list);
		mav.addObject("count", count);

		mav.setViewName("admin/message/messagereceived_search");
		return mav;
	}
	
	@RequestMapping(value="/admin_receivedmessagedelete")
	public ModelAndView receivedMessageDelete(@RequestParam int message_no) throws Exception {
		MessageVO dto = messageService.getMessage(message_no);

		if(dto.getMessage_hide().equals("Y")) {
			messageService.deleteMessage(message_no);
		}else {
			messageService.updateIsDeletedByReceiver(message_no);
		}

		return new ModelAndView("redirect:admin_messagereceived");
	}

	@RequestMapping(value="/admin_messagesent")
	public ModelAndView messageSent(HttpSession session, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();

		String adminid = (String)session.getAttribute("userid");

		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = messageService.getCount_sentlistfromadmin(adminid);

		if(endRow>count) {
			endRow=count;
		}

		List<MessageVO> sentlistfromadmin = null;
		sentlistfromadmin = messageService.sentlistfromadmin(adminid, startRow, endRow);

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

		mav.addObject("count", count);
		mav.addObject("sentlistfromadmin", sentlistfromadmin);

		mav.setViewName("admin/message/messagesent");
		return mav;
	}
	
	@RequestMapping(value="/admin_sentmessagesearch", method=RequestMethod.GET)
	public ModelAndView search_sentmessage(@RequestParam(value = "searchString" , required = false) String searchString, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = req.getSession();

		String adminid = (String)session.getAttribute("userid");

		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;

		int count = 0;


		if(searchString.equals("")) {
			count = messageService.getCount_sentlistfromadmin(adminid);
		}else if(!searchString.equals("")) {
			count = messageService.getCount_sentlistfromadmin_byCond(adminid, searchString);
		}

		if(endRow>count) {
			endRow=count;
		}

		List<UserVO> list = null;
		list = (List<UserVO>) adminService.sentmessagesearch(adminid, searchString, startRow, endRow);

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

		mav.addObject("searchString", searchString);

		mav.addObject("sentlistfromadmin", list);
		mav.addObject("count", count);

		mav.setViewName("admin/message/messagesent_search");
		return mav;
	}
	
	@RequestMapping(value="/admin_sentmessagedelete")
	public ModelAndView sentMessageDelete(@RequestParam int message_no) throws Exception {
		messageService.updateIsDeletedBySender(message_no);

		return new ModelAndView("redirect:admin_messagesent");
	}
	
	@RequestMapping(value="/admin_sentmessagehide")
	public ModelAndView sentMessageHide(@RequestParam int message_no) throws Exception {
		messageService.updateHide(message_no);

		return new ModelAndView("redirect:admin_messagesent");
	}
	


	//Noticeboard
	@RequestMapping(value = "/admin_noticeindex")
	public ModelAndView noticeboard_index(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = noticeboardService.getCount();

		if(endRow>count) {endRow=count;}
		List<NoticeboardVO> list = null;
		list = (List<NoticeboardVO>) noticeboardService.listNoticeBoard(startRow,endRow);

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

		mav.addObject("noticeboardlist", list);
		mav.addObject("count", count);

		mav.setViewName("admin/notice/notice_index");
		return mav;
	}

	@RequestMapping(value = "/admin_noticewrite", method = RequestMethod.GET)
	public ModelAndView noticeboard_write(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/notice/notice_write");
		return mav;
	}

	@RequestMapping(value = "/admin_noticewrite", method = RequestMethod.POST)
	public @ResponseBody int noticeboard_writePro(HttpServletRequest req, @RequestParam Map<String,String> requestParams) {
		String noticeboard_title = requestParams.get("noticeboard_title");
		String noticeboard_content = requestParams.get("noticeboard_content");

		NoticeboardVO dto = new NoticeboardVO();

		dto.setNoticeboard_title(noticeboard_title);
		dto.setNoticeboard_content(noticeboard_content);

		int res = noticeboardService.insertNoticeBoard(dto);

		return res;
	}

	@RequestMapping(value="/admin_noticecontent")
	public String noticeboard_content(HttpServletRequest req, @RequestParam int noticeboard_no) {
		noticeboardService.readCount(noticeboard_no);
		NoticeboardVO dto = noticeboardService.getNoticeBoard(noticeboard_no);
		req.setAttribute("getNoticeBoard", dto);

		return "admin/notice/notice_content";
	}

	@RequestMapping(value="/admin_noticerepresent", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView noticeboard_represent(HttpServletRequest req, @RequestParam int noticeboard_no) {
		ModelAndView mav = new ModelAndView();

		if(noticeboard_no!=0) {
			noticeboardService.resetRepresentingNotice();
			noticeboardService.setRepresentingNotice(noticeboard_no);

			NoticeboardVO represent = noticeboardService.getRepresentingNoticeBoard();
			mav.addObject("representNotice", represent);
		}

		mav.setViewName("mainindex");
		return mav;
	}
	
	@RequestMapping(value="/admin_noticedelete")
	public ModelAndView noticeboard_deletePro(@RequestParam String noticeboard_no) {
		
		noticeboardService.deleteNoticeBoard(Integer.parseInt(noticeboard_no));
		
		return new ModelAndView("redirect:admin_noticeindex"); 
	}

	//Musics
	@RequestMapping(value="/allMusic_admin")
	public ModelAndView allMusic_admin(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();

		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = adminService.getCount();

		if(endRow>count) {endRow=count;}
		List<UserVO> list = null;
		list = (List<UserVO>) adminService.allMusic_admin(startRow, endRow); 

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


		mav.addObject("allMusic_admin", list);

		mav.setViewName("admin/music/allMusic_admin");
		return mav;
	}
	
	//Albums
	@RequestMapping(value="/allMusicBoard_admin")
	public ModelAndView allMusicBoard_admin(HttpServletRequest req) throws Exception {

		ModelAndView mav = new ModelAndView();

		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = adminService.getCount();

		if(endRow>count) {endRow=count;}
		List<UserVO> list = null;
		list = (List<UserVO>) adminService.allMusicBoard_admin(startRow, endRow); 
		
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


		mav.addObject("allMusicBoard_admin", list);

		mav.setViewName("admin/music/allMusicBoard_admin");
		return mav;
	}
	
	//SNS
	@RequestMapping(value="/allSns_admin")
	public ModelAndView allSns_admin(HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();

		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = adminService.getCount();

		if(endRow>count) {endRow=count;}
		List<UserVO> list = null;
		list = (List<UserVO>) adminService.allSns_admin(startRow, endRow); 

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


		mav.addObject("allSns_admin", list);

		mav.setViewName("admin/sns/allSns_admin");
		return mav;
	}
	
	//Busking
	@RequestMapping(value="/busking_admin", method=RequestMethod.GET)
	public ModelAndView buskingAdminForm(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		ModelAndView mav = new ModelAndView();

		String pageNum = req.getParameter("pageNum");
		if(pageNum==null){
			pageNum ="1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow =(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		int count = buskingService.busgetCount();

		if(endRow>count) {endRow=count;}
		List<BuskingVO> list = null;	
		list = buskingService.alllistBusking(startRow, endRow); 

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


		mav.addObject("buskingList", list);

		mav.setViewName("admin/busking/allBusking_admin");
		return mav;
	}
	

	@RequestMapping(value="/busking_admin", method=RequestMethod.POST)
	public ModelAndView buskingAdminPro(HttpServletRequest req, @RequestParam String busking_no) throws Exception {
		int snum = Integer.parseInt(busking_no);
		BuskingVO dto = buskingService.getBusking(snum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("getBusking", dto);
		mav.setViewName("admin/busking/allBusking_admin");
		return mav;
	} 


	@RequestMapping(value="/busking_approval", method=RequestMethod.POST)
	public @ResponseBody int busking_approval(HttpServletRequest req) {
		BuskingVO dto = new BuskingVO();

		String busking_visibility = req.getParameter("busking_visibility");
		String busking_no = req.getParameter("busking_no");

		dto.setBusking_no(Integer.parseInt(busking_no));
		dto.setBusking_visibility(Integer.parseInt(busking_visibility));
		int res = buskingService.approveBusking(dto);

		return res;
	}


}