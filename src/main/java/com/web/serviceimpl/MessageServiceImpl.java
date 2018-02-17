package com.web.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.dao.MessageDao;
import com.web.model.MessageVO;
import com.web.service.MessageService;

@Service("messageService")
public class MessageServiceImpl implements MessageService {

	@Resource(name="messageDao")
	private MessageDao messageDao;

	@Override
	public int insertMessage(MessageVO dto) {
		// TODO Auto-generated method stub
		return messageDao.insertMessage(dto);
	}

	@Override
	public int updateIsDeletedByReceiver(int message_no) {
		// TODO Auto-generated method stub
		return messageDao.updateIsDeletedByReceiver(message_no);
	}

	@Override
	public int updateIsDeletedBySender(int message_no) {
		// TODO Auto-generated method stub
		return messageDao.updateIsDeletedBySender(message_no);
	}

	@Override
	public int updateHide(int message_no) {
		// TODO Auto-generated method stub
		return messageDao.updateHide(message_no);
	}

	@Override
	public MessageVO getMessage(int message_no) {
		// TODO Auto-generated method stub
		return messageDao.getMessage(message_no);
	}

	@Override
	public int deleteMessage(int message_no) {
		// TODO Auto-generated method stub
		return messageDao.deleteMessage(message_no);
	}

	@Override
	public int getCount_receivedlistfromuser(String adminid) {
		// TODO Auto-generated method stub
		return messageDao.getCount_receivedlistfromuser(adminid);
	}

	@Override
	public int getCount_receivedlistfromuser_byCond(String adminid, String searchString) {
		// TODO Auto-generated method stub
		return messageDao.getCount_receivedlistfromuser_byCond(adminid, searchString);
	}

	@Override
	public int getCount_receivedlistfromadmin(String userid) {
		// TODO Auto-generated method stub
		return messageDao.getCount_receivedlistfromadmin(userid);
	}

	@Override
	public int getCount_receivedlistfromadmin_byCond(String userid, String searchString) {
		// TODO Auto-generated method stub
		return messageDao.getCount_receivedlistfromadmin_byCond(userid, searchString);
	}

	@Override
	public int getCount_sentlistfromadmin(String adminid) {
		// TODO Auto-generated method stub
		return messageDao.getCount_sentlistfromadmin(adminid);
	}

	@Override
	public int getCount_sentlistfromadmin_byCond(String adminid, String searchString) {
		// TODO Auto-generated method stub
		return messageDao.getCount_receivedlistfromadmin_byCond(adminid, searchString);
	}

	@Override
	public int getCount_sentlistfromuser(String userid) {
		// TODO Auto-generated method stub
		return messageDao.getCount_sentlistfromuser(userid);
	}

	@Override
	public int getCount_sentlistfromuser_byCond(String userid, String searchString) {
		// TODO Auto-generated method stub
		return messageDao.getCount_sentlistfromuser_byCond(userid, searchString);
	}

	@Override
	public List<MessageVO> sentlistfromadmin(String adminid, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return messageDao.sentlistfromadmin(adminid, startRow, endRow);
	}

	@Override
	public List<MessageVO> receivedlistfromuser(String adminid, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return messageDao.receivedlistfromuser(adminid, startRow, endRow);
	}

	@Override
	public List<MessageVO> sentlistfromuser(String userid, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return messageDao.sentlistfromuser(userid, startRow, endRow);
	}

	@Override
	public List<MessageVO> receivedlistfromadmin(String userid, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return messageDao.receivedlistfromadmin(userid, startRow, endRow);
	}

	@Override
	public void updateMessageRead(int message_no) {
		// TODO Auto-generated method stub
		messageDao.updateMessageRead(message_no);
	}
	


	

	


	

	


}
