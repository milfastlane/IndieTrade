package com.web.security;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.web.model.UserVO;
import com.web.service.LogService;

public class CustomizeAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	private static final Logger logger = LoggerFactory.getLogger(CustomizeAuthenticationSuccessHandler.class);

	@Autowired
	private LogService logService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp, Authentication auth) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String authUser = (String) auth.getPrincipal(); //get id
		
		UserVO dto = logService.getMember_login_id(authUser);
		
		//Session1. email authentication
		session.setAttribute("isemailauth", dto.getUser_emailauth());

		//Session2. user id 
		session.setAttribute("authuser", authUser);

		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities(); 

		Iterator<? extends GrantedAuthority> iter = authorities.iterator(); 
		while (iter.hasNext()) { 
			GrantedAuthority auth2 = iter.next(); 
			//Session3. user authority
			session.setAttribute("authorities", auth2.getAuthority());

		}

		resp.sendRedirect(req.getContextPath()+"/user_login_success");
	}





}
