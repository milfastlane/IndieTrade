package com.web.indietrade;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.web.security.TempKey;
import com.web.model.CategoryVO;
import com.web.model.MessageVO;
import com.web.model.MusicboardVO;
import com.web.model.NoticeboardVO;
import com.web.model.SnspageVO;
import com.web.model.UserVO;
import com.web.service.AdminService;
import com.web.service.LogService;
import com.web.service.MessageService;
import com.web.service.MusicboardService;
import com.web.service.NoticeboardService;
import com.web.service.SnsService;

@Secured({"ROLE_USER","ROLE_ADMIN","ROLE_ARTIST"})
@Controller
public class LogController {
	
	@Autowired
	private LogService logService;
	
	@Autowired
	private MessageService messageService;
	  
	@Autowired
	private AdminService adminService;

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private SnsService snsService;
	
	@Resource(name="uploadPath")
	private String uploadPath;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private NoticeboardService noticeboardService;
	
	@Autowired
	private MusicboardService musicboardService;
	
	@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
	@RequestMapping(value="/user_signup")
	public String signup() throws Exception{
		return "log/insertUser";   
	}
	
	@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
	@RequestMapping(value="/user_signup", method=RequestMethod.POST)
	public ModelAndView insertUser(HttpServletRequest req,
			@ModelAttribute UserVO dto, @RequestParam Map<String,String> requestParams, BindingResult result) throws Exception {
		if (result.hasErrors()) {
			dto.setUser_no(0);
		}

		ModelAndView mav = new ModelAndView();

		String password = dto.getUser_passwd();
		String encryptPassword = passwordEncoder.encode(password);

		dto.setUser_passwd(encryptPassword);

		String dd = requestParams.get("dd");
		if(Integer.parseInt(dd)<10) {
			dd = "0" + dd;
		}

		dto.setUser_birth(requestParams.get("yyyy") + requestParams.get("mm") + dd); 
		
		dto.setUser_gender(requestParams.get("user_gender")); 

		dto.setUser_ip(req.getRemoteAddr()); //get ip address 

		//file
		String filename = "";
		int filesize = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("file");
		String rootPath = req.getSession().getServletContext().getRealPath("/");  
		String attachPath = "resources/img/client/";
		String ogfilename = file.getOriginalFilename();
		
		File target = new File(rootPath + attachPath + ogfilename);

		if (file.getSize()>0) {
			file.transferTo(target);
			filename = file.getOriginalFilename();
			filesize = (int)file.getSize();
		}

		dto.setUser_filename(filename);
		dto.setUser_filesize(filesize);

		String authority = "";
		authority = req.getParameter("authority");
		if(authority.equals("a")) { 
			dto.setUser_authority("artist");
		}else { 
			dto.setUser_authority("user");
		}

		int res = logService.insertUser(dto);    

		HttpSession session = req.getSession(false);
		session.setAttribute("id", dto.getUser_id());
		
		String token = "token";
		session.setAttribute("token", token);

		mav.setView(new RedirectView("user_authEmail")); //controller -> controller.
		return mav;
	}

	@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
	@RequestMapping(value = "/user_authEmail", method = {RequestMethod.GET})
	public ModelAndView authEmail(HttpServletRequest req, HttpServletResponse arg1) throws Exception{

		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession(false);
		
		if(session.getAttribute("token")==null) {
			return new ModelAndView("redirect:/");
		}

		if(session.getAttribute("token").equals("token")) {
			String id = (String)session.getAttribute("id");
			
			UserVO dto = null;
			dto = logService.getMember_login_id(id);
			
			String key = new TempKey().getKey(50, false);

			String setfrom = "no-reply@indietrade.kr";
			String tomail  = dto.getUser_email();  
			String title   = "[INDIETRADE] email authentication";      
			String content = "<h1>Hello, " + dto.getUser_name() +"</h1>"
					+ "Please click the link below to proceed with your authentication <br>"
					+ "<a href='http://localhost:8081/indietrade/user_emailConfirm?key="
					+ key+"&id="+dto.getUser_id()
					+ "' target='_blenk'>CLICK</a>";


			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper 
				= new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(new InternetAddress(setfrom, "IndieTrade"));  
				messageHelper.setTo(tomail);     
				messageHelper.setSubject(title); 
				messageHelper.setText(content, true);  

				mailSender.send(message);
			
				session.removeAttribute("token");
				
				mav.addObject("email", dto.getUser_email());
				mav.setViewName("log/signupOk");

			} catch(Exception e){
				e.printStackTrace();
			}
		}else {
			mav.setViewName("mainindex");
		}

		return mav; 
	}

	@Secured({"ROLE_USER","ROLE_ADMIN","ROLE_ARTIST","ROLE_GUEST"})
	@RequestMapping(value = "/user_emailConfirm", method = {RequestMethod.GET})
	public @ResponseBody ModelAndView emailConfirm(HttpServletRequest arg0, Model model) throws Exception{
		
		ModelAndView mav = new ModelAndView();

		if(arg0.getParameter("key")!=null) {
			HttpSession session = arg0.getSession(false);
			
			
			String user = arg0.getParameter("id");
			UserVO dto = logService.getMember_login_id(user);
					
			logService.updateEmailAuth(dto);
			
			mav.setViewName("log/emailAuthOk");

			SecurityContextHolder.clearContext();
			if(session != null) {
				session.invalidate();
			}

		}

		return mav;
	}
	
	@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
	@RequestMapping(value="/user_login")
	public String login() throws Exception{
		return "log/login";   
	}

	@RequestMapping(value="/user_receivedmessagesearch", method=RequestMethod.GET)
	public ModelAndView search_userreceivedmessage(@RequestParam(value = "searchString" , required = false) String searchString, HttpServletRequest req) {
	  		ModelAndView mav = new ModelAndView();
	  	
	  		HttpSession session = req.getSession();
	  		
	  		String userid = (String)session.getAttribute("userid");
	  		
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
	  			count = messageService.getCount_receivedlistfromadmin(userid);
	  			
	  		}else if(!searchString.equals("")) {
	  			count = messageService.getCount_receivedlistfromadmin_byCond(userid, searchString);
	  			
	  		}

	  		if(endRow>count) {
	  			endRow=count;
	  		}
	  		
	  		System.out.println("startRow : " + startRow);
	  		System.out.println("endRow : " + endRow);
	  		
	  		List<UserVO> list = null;
	  		list = (List<UserVO>) adminService.receivedmessagesearch_user(userid, searchString, startRow, endRow);

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
	  		
	  		mav.addObject("receivedlistfromadmin", list);
	  		mav.addObject("count", count);
	  		
	  		mav.setViewName("message/messagereceived_search");
	  		return mav;		
	  	}
	   
	   
	   @RequestMapping(value="/user_sentmessagesearch", method=RequestMethod.GET)
	 	public ModelAndView search_usersentmessage(@RequestParam(value = "searchString" , required = false) String searchString, HttpServletRequest req) {
	 		ModelAndView mav = new ModelAndView();
	 		
	 		HttpSession session = req.getSession();
	 		
	 		String userid = (String)session.getAttribute("userid");
	 	
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
	 			count = messageService.getCount_sentlistfromuser(userid);
	 	
	 		}else if(!searchString.equals("")) {
	 			count = messageService.getCount_sentlistfromuser_byCond(userid, searchString);
	 			
	 		}
	 	
	 		if(endRow>count) {
	 			endRow=count;
	 		}
	 		
	 		List<UserVO> list = null;
	 		list = (List<UserVO>) adminService.sentmessagesearch(userid, searchString, startRow, endRow);

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
	 		
	 		mav.addObject("sentlistfromuser", list);
	 		mav.addObject("count", count);
	 		
	 		mav.setViewName("message/messagesent_search");
	 		return mav;
	}
	
	@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
	@RequestMapping(value="/user_aorf")
	public String aorf() throws Exception{
		return "log/aorf";   
	}
	
	@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
	@RequestMapping(value = "/user_checkId", method = { RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int idCheck(UserVO dto) throws Exception{
		return logService.checkId(dto);
	}
	
	@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
	@RequestMapping(value = "/user_checkEmail", method = { RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int emailCheck(UserVO dto) throws Exception{
		return logService.checkEmail(dto);
	}
	
	@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
	@RequestMapping(value = "/user_checkPhone", method = { RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int phoneCheck(UserVO dto) throws Exception{
		return logService.checkPhone(dto);
	}
	
	@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
	@RequestMapping(value = "/user_checkNBE", method = {RequestMethod.POST})
	public @ResponseBody int NBECheck(HttpServletRequest arg0, UserVO dto) throws Exception{

		int res = logService.checkNBE(dto);

		String email = arg0.getParameter("user_email");  
		UserVO _dto = logService.getMember(email);

		if(res==1) {

			String setfrom = "milfastlane11@gmail.com";
			String receiverName = arg0.getParameter("user_name");
			String tomail  = arg0.getParameter("user_email");     
			String title   = "Indietrade id find mail.";      
			String content = receiverName + ", Hello. "
					+ "<br> your Id : " + _dto.getUser_id();    
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper 
				= new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(new InternetAddress(setfrom, "IndieTrade"));  
				messageHelper.setTo(tomail);     
				messageHelper.setSubject(title); 
				messageHelper.setText(content, true);  

				mailSender.send(message);

			} catch(Exception e){
				e.printStackTrace();
			}
		}

		return res;
	}
	
	@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
	@RequestMapping(value = "/user_checkIE", method = {RequestMethod.POST})
	public @ResponseBody int IECheck(HttpServletRequest arg0, UserVO dto) throws Exception{

		String email2 = arg0.getParameter("user_email");
		dto.setUser_email(email2);

		String tempPassword = new TempKey().getKey(8, false);

		int res = logService.checkIE(dto);
		if(res==1) {
			String setfrom = "milfastlane11@gmail.com";         
			String tomail  = arg0.getParameter("user_email");    
			String title   = "Indietrade reset password";      
			String content = arg0.getParameter("user_id") + ", Hello." 
					+ "<br> Your new temporary password is : " + tempPassword;

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper 
				= new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(new InternetAddress(setfrom, "IndieTrade"));  
				messageHelper.setTo(tomail);     
				messageHelper.setSubject(title); 
				messageHelper.setText(content, true);  

				mailSender.send(message);

				UserVO _dto = logService.getMember_login_id(arg0.getParameter("user_id"));

				if(_dto!=null) {

					String newencryptPassword = passwordEncoder.encode(tempPassword);
					_dto.setUser_passwd(newencryptPassword);

					logService.updatePassword(_dto);
				}
				
			} catch(Exception e){
				e.printStackTrace();
			}

		}

		return res;

	}

	@RequestMapping(value = "/user_info", method = {RequestMethod.GET})
	public ModelAndView userInfo(HttpServletRequest req, HttpServletResponse resp, @RequestParam int no) throws Exception{
		ModelAndView mav = new ModelAndView();

		UserVO dto = logService.getMember_no(no);
		
		mav.addObject("dto", dto);

		mav.setViewName("log/userInfo");
		return mav;
	}
	
	@RequestMapping(value="/user_delete",  method=RequestMethod.GET)
	public ModelAndView deleteUser(HttpServletRequest req, @RequestParam int no) {
		ModelAndView mav = new ModelAndView();
		
		UserVO dto = logService.getMember_no(no);
		
		mav.addObject("dto", dto);

		mav.setViewName("log/deleteUser");
		return mav;
	}

	@RequestMapping(value="/user_deleteConfirm", method={ RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteUser(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();

		String authuser = (String) session.getAttribute("authuser");

		UserVO dto = null;

		if(authuser!=null) {
			dto = logService.getMember_login_id(authuser);
		}
		if(dto.getUser_authority().equals("artist")) {
			snsService.snspage_del(dto.getUser_no());
		}
		logService.updateDeletedUser(dto);
		
		ModelAndView mav = new ModelAndView();

		SecurityContextHolder.clearContext();
		if(session != null) {
			session.invalidate();
		}
		
		mav.setViewName("mainindex");
		return mav;
	}

	@RequestMapping(value="/user_update", method=RequestMethod.GET)
	public ModelAndView updateUser(HttpServletRequest req, @RequestParam int no) {
		ModelAndView mav = new ModelAndView();

		UserVO dto = logService.getMember_no(no);
	
		mav.addObject("dto", dto);

		mav.setViewName("log/updateUser");
		return mav;
	}

	@RequestMapping(value="/user_update", method=RequestMethod.POST)
	public ModelAndView updateUser(HttpServletRequest req, @RequestParam Map<String,String> requestParams) throws Exception {
		HttpSession session = req.getSession();

		UserVO dto = null;
		String authuser = (String) session.getAttribute("authuser");
		if(authuser!=null) {
			dto = logService.getMember_login_id(authuser);
		}

		ModelAndView mav = new ModelAndView();

		String password = requestParams.get("passwd");
		String encryptPassword = passwordEncoder.encode(password);

		dto.setUser_passwd(encryptPassword);

		String dd = requestParams.get("dd");
		if(Integer.parseInt(dd)<10) {
			dd = "0" + dd;
		}

		dto.setUser_birth(requestParams.get("yyyy") + requestParams.get("mm") + dd); 
		dto.setUser_gender(requestParams.get("gender")); 

		dto.setUser_phone(requestParams.get("phone"));

		//file
		String filename = "";
		int filesize = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("file");
		String rootPath = req.getSession().getServletContext().getRealPath("/");  
		String attachPath = "resources/img/client/";
		String ogfilename = file.getOriginalFilename();

		File target = new File(rootPath + attachPath + ogfilename);

		if (file.getSize()>0) {
			file.transferTo(target);
			filename = file.getOriginalFilename();
			filesize = (int)file.getSize();
		}
		dto.setUser_filename(filename);
		dto.setUser_filesize(filesize);
		
		session.setAttribute("id", dto.getUser_id());
		
		logService.updateUser(dto);    
		
		
		mav.setViewName("mainindex");
		return mav;
	}

	  @RequestMapping(value="/user_messagebox")
	   public ModelAndView messageBox() throws Exception {
	      
	      ModelAndView mav = new ModelAndView();
	      
	      mav.setViewName("message/messagebox");
	      return mav;
	   }
	   
	   @RequestMapping(value="/user_messageindividual")
	   public ModelAndView messageIndividual(HttpServletRequest req, @RequestParam String artistno) throws Exception {
	      
	      ModelAndView mav = new ModelAndView();
	     UserVO udto= logService.getMember_no(Integer.parseInt(artistno));
	  
	      mav.addObject("receiverid", udto.getUser_id());
	      
	      mav.setViewName("message/messageindividual");
	      return mav;
	   }
	   
	   @RequestMapping(value="/user_messagereceived")
	   public ModelAndView messageReceived(HttpSession session, HttpServletRequest req) throws Exception {
	      
	      ModelAndView mav = new ModelAndView();
	      
	      String userid = (String)session.getAttribute("userid");
	    
	      String pageNum = req.getParameter("pageNum");
	        if(pageNum==null){
	           pageNum ="1";
	        }
	        int pageSize = 5;
	        int currentPage = Integer.parseInt(pageNum);
	        int startRow =(currentPage-1)*pageSize+1;
	        int endRow = startRow+pageSize-1;
	        int count = messageService.getCount_receivedlistfromadmin(userid);
	 
	        if(endRow>count) {endRow=count;}
	       
	        List<MessageVO> receivedlistfromadmin = null;
	        receivedlistfromadmin = messageService.receivedlistfromadmin(userid, startRow, endRow);

	
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
	    
	      
	      mav.addObject("receivedlistfromadmin", receivedlistfromadmin);
	      mav.setViewName("message/messagereceived");
	      return mav;
	   }
	   
	   @RequestMapping(value="/user_messagesent")
	   public ModelAndView messageSent(HttpSession session, HttpServletRequest req) throws Exception {
	      
	      ModelAndView mav = new ModelAndView();
	      
	      String userid = (String)session.getAttribute("userid");
	      
	      String pageNum = req.getParameter("pageNum");
	        if(pageNum==null){
	           pageNum ="1";
	        }
	        int pageSize = 5;
	        int currentPage = Integer.parseInt(pageNum);
	        int startRow =(currentPage-1)*pageSize+1;
	        int endRow = startRow+pageSize-1;
	        int count = messageService.getCount_sentlistfromuser(userid);
	        
	        if(endRow>count) {
	        	endRow=count;
	        }
	 
	        List<MessageVO> sentlistfromuser = null;
	        sentlistfromuser = messageService.sentlistfromuser(userid, startRow, endRow);
	         

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
	 
	      
	      mav.addObject("sentlistfromuser", sentlistfromuser);
	      
	      mav.setViewName("message/messagesent");
	      return mav;
	   }
	   
	   @RequestMapping(value="/user_messagecontent")
	   public ModelAndView messageContent(HttpServletRequest req, @RequestParam int message_no, @RequestParam(value = "message_read" , required = false) String message_read) throws Exception {
	      
	      ModelAndView mav = new ModelAndView();
	      
	      MessageVO dto = messageService.getMessage(message_no);
	      
	      if(message_read.equals("y")) {
	    	  messageService.updateMessageRead(message_no);
	    	
	    	  
	      }
	      
	   
	      mav.addObject("messageinfo", dto);
	      
     
	      mav.setViewName("message/messagecontent");
	      return mav;
	   }
	   
	   @RequestMapping(value="/user_receivedmessagedelete")
	   public ModelAndView receivedMessageDelete(HttpServletRequest req, @RequestParam int message_no) throws Exception {
	      
	      ModelAndView mav = new ModelAndView();
	      
	      MessageVO dto = messageService.getMessage(message_no);
	      
	      HttpSession session = req.getSession();
	    
	      //if sender hide,
	      if(dto.getMessage_hide().equals("Y")) { 
	    	  messageService.deleteMessage(message_no);
	        
	      }else {
	    	  messageService.updateIsDeletedByReceiver(message_no);
	      }
	      
	      
	      return new ModelAndView("redirect:user_messagereceived");
	   }
	   
	   @RequestMapping(value="/user_sentmessagedelete")
	   public ModelAndView sentMessageDelete(@RequestParam int message_no) throws Exception {
	      
	      ModelAndView mav = new ModelAndView();
	      
	      MessageVO dto = messageService.getMessage(message_no);
	      
	   
	    	  messageService.updateIsDeletedBySender(message_no);
	      
	      
	      return new ModelAndView("redirect:user_messagesent");
	   }
	   
	   @RequestMapping(value="/user_sentmessagehide")
	   public ModelAndView sentMessageHide(@RequestParam int message_no) throws Exception {
	      
	      ModelAndView mav = new ModelAndView();
	      
	      
	      
	      messageService.updateHide(message_no);
	        
	      return new ModelAndView("redirect:user_messagesent");
	   }
	   
	   //individual -> other
	   @RequestMapping(value = "/user_messagewrite", method = RequestMethod.POST)
	   public ModelAndView message_writePro(HttpServletRequest req, @ModelAttribute MessageVO dto) {
	      ModelAndView mav = new ModelAndView();
	      
	      HttpSession session = req.getSession();
		  String userid = (String) session.getAttribute("userid");
		  
	      if(req.getParameter("from").equals("toadmin")) {
	    	  dto.setMessage_receiverid("admin"); //individual to admin.
	    	
	    	  dto.setMessage_senderid(userid); 
	      }else if(req.getParameter("from").equals("toindividual")){//individual -> individual
	    	
	    	  dto.setMessage_receiverid(req.getParameter("receiver"));
	    	  
	    	  dto.setMessage_senderid(userid); 
	    	  
	    	}

	      int res = messageService.insertMessage(dto);
	   
	      return new ModelAndView("redirect:user_messagesent");
	      
	   }

	   
	   @RequestMapping(value="/user_login_success")
		public ModelAndView loginSuccess(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws Exception{

			ModelAndView mav = new ModelAndView();

			String authuser = (String) session.getAttribute("authuser");
			UserVO dto = null;
			if(authuser!=null) {
				dto = logService.getMember_login_id(authuser);
				
				
				
				SnspageVO sdto = snsService.getsnspage(authuser);
				int issnspage;
				if(sdto==null||sdto.getSnspage_artistid()==null) {
					issnspage = 0;
				}else {
					issnspage = 1;
				}
				System.out.println(issnspage);
				logService.updateVisitHistory(dto); 
		
				//if logged in successfully authenticated, visit + 1
				adminService.plusVisit();
				
				// total visit count
				int totalCount = adminService.countVisit();

				// today visit count
				int todayCount = adminService.countVisit_today();

				// check if new message ( the received message where message_read='N' )
				
				session.setAttribute("totalCount", totalCount);
				session.setAttribute("todayCount", todayCount);
		 
				session.setAttribute("username", dto.getUser_name());
				session.setAttribute("no", dto.getUser_no());
				session.setAttribute("userid", dto.getUser_id());
				session.setAttribute("userno", dto.getUser_no());
				session.setAttribute("issnspage", issnspage);
				
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

				session.setAttribute("clist", clist);
				session.setAttribute("aclist", aclist);
				mav.addObject("boardList", list);
				
				NoticeboardVO representNotice = noticeboardService.getRepresentingNoticeBoard();
				mav.addObject("representNotice", representNotice);	
				
				mav.setViewName("mainindex");
				mav.addObject("msg", "success");

			}

			return mav;
		}
		
		@Secured("IS_AUTHENTICATED_ANONYMOUSLY")
		@RequestMapping(value="/user_login_failure")
		public ModelAndView loginFailure(HttpSession session) throws Exception{
			
			ModelAndView mav = new ModelAndView();
			
			String thrown = null;
			String msg = null;

			thrown = (String) session.getAttribute("thrown");

			if(thrown==null) {
				msg= "Either your id or password is wrong.\r\n" + 
						"Please check and try again.";
			}
			
			if(thrown!=null && thrown.equals("wrongpw")) {
				msg= "Either your id or password is wrong.\r\n" + 
						"Please check and try again.";
				
			}else if(thrown!=null && thrown.equals("noemailauth")) {
				msg = "This id is not authenticated.\r\n" + 
						"Please check your email.";
			} 
			mav.setViewName("log/login");
			mav.addObject("msg", msg);

			return mav;
		}
		
		
}