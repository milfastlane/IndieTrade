package com.web.security;


import java.util.Collection;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.web.model.UserVO;
import com.web.service.LogService;

@Component 
public class CustomAuthenticationProvider implements AuthenticationProvider { 
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class); 

	@Autowired 
	UserService userService; 

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private LogService logService;

	@Override  
	public Authentication authenticate(Authentication authentication) throws AuthenticationException { 
		String username = authentication.getPrincipal().toString(); 
		String password = (String) authentication.getCredentials().toString(); 

		User user = null; 
		Collection<? extends GrantedAuthority> authorities;

		UserVO dto = logService.getMember_login_id(username);

		//Get UserInfo.
		user = (User) userService.loadUserByUsername(username);
		if(user!=null) {

			
			//Unregistered id
			if(dto.getUser_passwd().equals("0")) {
				throw new BadCredentialsException("Invalid id.");
			}

			if(passwordEncoder.matches(password, user.getPassword())) { //if password correct

				if(dto.getUser_emailauth().equals("Y")) { //if email authenticated
					authorities = user.getAuthorities();
					return new UsernamePasswordAuthenticationToken(username, password, authorities);
				}else { //if email not authenticated
					throw new DisabledException("Email Not Authenticated.");
				}

			} else { //if password incorrect
				throw new BadCredentialsException("Wrong Password.");

			}
		}else {
			
		
			
			throw new UsernameNotFoundException("Username not found");

		}
		
	}


	@Override 
	public boolean supports(Class<?> arg0) { 
		return true; 
	}

}

