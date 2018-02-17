package com.web.dao;

import javax.servlet.http.HttpSession;

import com.web.model.UserVO;

public interface LogDao {

	int insertUser(UserVO dto);
	int checkId(UserVO dto);
	int checkEmail(UserVO dto);
	int checkPhone(UserVO dto);
	int checkNBE(UserVO dto);
	int checkIE(UserVO dto);
	int updateUser(UserVO dto);
	int updatePassword (UserVO dto);
	int updateDeletedUser (UserVO dto);
	int updateVisitHistory (UserVO dto);
	int updateEmailAuth (UserVO dto);
	UserVO getMember (String email);
	UserVO getMember_no (int user_no);
	UserVO getMember_username (String username);
	UserVO getMember_name (String user_name);
	UserVO getMember_login_id(String user_id);
	boolean loginCheck(UserVO dto, HttpSession session);
	
	
}
