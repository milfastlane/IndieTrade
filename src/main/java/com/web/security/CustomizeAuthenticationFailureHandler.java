package com.web.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomizeAuthenticationFailureHandler implements AuthenticationFailureHandler{

	private static final Logger logger = LoggerFactory.getLogger(CustomizeAuthenticationFailureHandler.class);

	@Override
	public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse resp, AuthenticationException arg2) throws IOException, ServletException  {
		
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		
		String thrown = null;
		session.setAttribute("thrown", thrown);
		
		if(arg2.getClass().isAssignableFrom(BadCredentialsException.class)) {
			thrown = "wrongpw";
			session.setAttribute("thrown", thrown);

		} else if (arg2.getClass().isAssignableFrom(DisabledException.class)) {
			thrown = "noemailauth";
			session.setAttribute("thrown", thrown);

		} 
		
		resp.sendRedirect(req.getContextPath() + "/user_login_failure"); 

	}






}
