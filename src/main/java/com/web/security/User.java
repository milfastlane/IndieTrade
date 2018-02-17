package com.web.security;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails {
	private static final long serialVersionUID = 1L; 

	private String username; 
	private String password; 
	
	// add additional user information. ex) email, phone etc.
	private String emailAuth;
	public String getEmailAuth() {
		return emailAuth;
	}
	public void setEmailAuth(String emailAuth) {
		this.emailAuth = emailAuth;
	}
	
	private List<Role> authorities;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() { 
		return this.authorities;
	}
	public void setAuthorities(List<Role> roles) { 
		this.authorities = roles; 
	}

	@Override 
	public String getUsername() { 
		return username; 
	} 
	public void setUsername(String username) { 
		this.username = username; 
	} 
	@Override 
	public String getPassword() { 
		return password; 
	} 
	public void setPassword(String password) { 
		this.password = password; 
	}


	//NOT USED
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
	

	
	



}
