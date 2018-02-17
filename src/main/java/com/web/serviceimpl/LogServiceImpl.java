package com.web.serviceimpl;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.LogDao;
//import com.web.model.HistoryDBBean;
import com.web.model.UserVO;
import com.web.service.LogService;

@Service("logService")
public class LogServiceImpl implements LogService {
	
	@Resource(name="logDao")
	private LogDao logDao;

	@Override
	public int insertUser(UserVO dto) {
		// TODO Auto-generated method stub
		return logDao.insertUser(dto);
	}

	@Override
	public int checkId(UserVO dto) {
		// TODO Auto-generated method stub
		return logDao.checkId(dto);
	}

	@Override
	public int checkEmail(UserVO dto) {
		// TODO Auto-generated method stub
		return logDao.checkEmail(dto);
	}

	@Override
	public int checkPhone(UserVO dto) {
		// TODO Auto-generated method stub
		return logDao.checkPhone(dto);
	}

	@Override
	public int checkNBE(UserVO dto) {
		// TODO Auto-generated method stub
		return logDao.checkNBE(dto);
	}

	@Override
	public int checkIE(UserVO dto) {
		// TODO Auto-generated method stub
		return logDao.checkIE(dto);
	}

	@Override
	public int updateUser(UserVO dto) {
		// TODO Auto-generated method stub
		return logDao.updateUser(dto);
	}

	@Override
	public int updatePassword(UserVO dto) {
		// TODO Auto-generated method stub
		return logDao.updatePassword(dto);
	}

	@Override
	public int updateDeletedUser(UserVO dto) {
		// TODO Auto-generated method stub
		return logDao.updateDeletedUser(dto);
	}

	@Override
	public int updateVisitHistory(UserVO dto) {
		// TODO Auto-generated method stub
		return logDao.updateVisitHistory(dto);
	}

	@Override
	public int updateEmailAuth(UserVO dto) {
		// TODO Auto-generated method stub
		return logDao.updateEmailAuth(dto);
	}

	@Override
	public UserVO getMember(String email) {
		// TODO Auto-generated method stub
		return logDao.getMember(email);
	}

	@Override
	public UserVO getMember_no(int user_no) {
		// TODO Auto-generated method stub
		return logDao.getMember_no(user_no);
	}

	@Override
	public UserVO getMember_username(String username) {
		// TODO Auto-generated method stub
		return logDao.getMember_username(username);
	}

	@Override
	public UserVO getMember_name(String user_name) {
		// TODO Auto-generated method stub
		return logDao.getMember_name(user_name);
	}

	@Override
	public UserVO getMember_login_id(String user_id) {
		// TODO Auto-generated method stub
		return logDao.getMember_login_id(user_id);
	}

	@Override
	public boolean loginCheck(UserVO dto, HttpSession session) {
		// TODO Auto-generated method stub
		return logDao.loginCheck(dto, session);
	}
	
	
	
	  
}
