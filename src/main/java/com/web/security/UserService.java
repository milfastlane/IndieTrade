package com.web.security;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service; 

import com.web.model.UserVO;
import com.web.service.LogService;

@Service
public class UserService implements UserDetailsService{
	
	@Autowired
	private LogService logService;
	
	@Override
	public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
		
		UserVO dto = logService.getMember_username(username);

		User user = null;
		
		if(dto!=null) {	
			user = new User();
			user.setUsername(username);
			user.setPassword(dto.getUser_passwd());
			
			Role role = new Role();
			if(dto.getUser_authority().equals("admin")) {
				role.setName("ROLE_ADMIN");
			}else if(dto.getUser_authority().equals("artist")) {
				role.setName("ROLE_ARTIST");
			}else if(dto.getUser_authority().equals("user")) {
				role.setName("ROLE_USER");
			} 
			
			List<Role> roles = new ArrayList<Role>();
			roles.add(role);
			user.setAuthorities(roles);
		
			user.setEmailAuth(dto.getUser_emailauth());
		
		}
		
		return user;
		
	}
}
