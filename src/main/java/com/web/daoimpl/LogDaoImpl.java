package com.web.daoimpl;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.LogDao;
import com.web.model.UserVO;

@Repository("logDao")
public class LogDaoImpl implements LogDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertUser(UserVO dto) {
		return sqlSession.insert("insertUser", dto);
	}
	
	@Override
	public int checkId(UserVO dto) {
		int isIdExist = sqlSession.selectOne("checkId", dto);
		
		return isIdExist;
		
	}
	
	@Override
	public int checkEmail(UserVO dto) {
		int isEmailExist = sqlSession.selectOne("checkEmail", dto);
		
		return isEmailExist;
		
	}
	
	@Override
	public int checkPhone(UserVO dto) {
		int isPhoneExist = sqlSession.selectOne("checkPhone", dto);
		
		return isPhoneExist;
		
	}
	
	@Override
	public int checkNBE(UserVO dto) { 
		int isNBE = sqlSession.selectOne("checkNBE", dto);
		
		return isNBE;
		
	}
	
	@Override
	public int checkIE(UserVO dto) {
		int isIE = sqlSession.selectOne("checkIE", dto);
		
		return isIE;
		
	}
	
	@Override
	public int updateUser(UserVO dto) {
		return sqlSession.update("updateUser", dto);
	}

	@Override
	public int updatePassword (UserVO dto) {
		int isPwChanged = sqlSession.update("updatePassword", dto);
		
		return isPwChanged;
	}
	
	@Override
	public int updateDeletedUser (UserVO dto) {
		int isDeletedUserUpdated = sqlSession.delete("updatedeleteduser", dto);
		
		return isDeletedUserUpdated;
	}
	
	@Override
	public int updateVisitHistory (UserVO dto) {
		int isUserVisitHistoryUpdated = sqlSession.update("updatevisithistory", dto);
		
		return isUserVisitHistoryUpdated;
	}
	
	@Override
	public int updateEmailAuth (UserVO dto) {
		int isEmailAuthUpdated = sqlSession.update("updateEmailAuth", dto);
		
		return isEmailAuthUpdated;
	}
	
	@Override
	public UserVO getMember (String email) {
		UserVO dto = null;
		dto = (UserVO)sqlSession.selectOne("getMember", email);
		
		return dto;
	}
	
	@Override
	public UserVO getMember_no (int user_no) {
		UserVO dto = null;
		dto = (UserVO)sqlSession.selectOne("getMember_no", user_no);
		
		return dto;
	}
	
	@Override
	public UserVO getMember_username (String username) {
		UserVO dto = null;
		dto = (UserVO)sqlSession.selectOne("getMember_username", username);
		
		return dto;
	}
	
	@Override
	public UserVO getMember_name (String user_name) {
		UserVO dto = null;
		dto = (UserVO)sqlSession.selectOne("getMember_name", user_name);
		
		return dto;
	}
	
	@Override
	public UserVO getMember_login_id(String user_id) {
		UserVO dto = null;
		if(user_id=="") {
			user_id=null;
			
		}
		dto = (UserVO)sqlSession.selectOne("getMember_login_id", user_id);
		return dto;
	}
	
	@Override
	public boolean loginCheck(UserVO dto, HttpSession session) {
		 String name = sqlSession.selectOne("loginCheck", dto);
	
	     return (name == null) ? false : true;
	}
}
