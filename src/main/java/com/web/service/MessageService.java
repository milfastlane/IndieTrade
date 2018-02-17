package com.web.service;

import java.util.List;

import com.web.model.MessageVO;

public interface MessageService {
	
	int insertMessage(MessageVO dto);
	int updateIsDeletedByReceiver(int message_no);
	int updateIsDeletedBySender(int message_no);
	int updateHide(int message_no);
	MessageVO getMessage(int message_no);
	int deleteMessage(int message_no);
	int getCount_receivedlistfromuser(String adminid);
	int getCount_receivedlistfromuser_byCond(String adminid, String searchString);
	int getCount_receivedlistfromadmin(String userid);
	int getCount_receivedlistfromadmin_byCond(String userid, String searchString);
	int getCount_sentlistfromadmin(String adminid);
	int getCount_sentlistfromadmin_byCond(String adminid, String searchString);
	int getCount_sentlistfromuser(String userid);
	int getCount_sentlistfromuser_byCond(String userid, String searchString);
	List<MessageVO> sentlistfromadmin(String adminid, int startRow, int endRow);
	List<MessageVO> receivedlistfromuser(String adminid, int startRow, int endRow);
	List<MessageVO> sentlistfromuser(String userid, int startRow, int endRow);
	List<MessageVO> receivedlistfromadmin(String userid, int startRow, int endRow);
	void updateMessageRead(int message_no);
	
}
