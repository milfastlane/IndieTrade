package com.web.model;

import java.util.Date;

public class MessageVO {
	private int message_no;
	private String message_receiverid;
	private String message_senderid;
	private String message_title;
	private String message_context;
	private Date message_datesent;
	private Date message_datereceived;
	private String message_read;
	private String message_isdeletedbyreceiver;
	private String message_isdeletedbysender;
	private String message_hide; //from sent
	
	
	public int getMessage_no() {
		return message_no;
	}
	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}
	public String getMessage_receiverid() {
		return message_receiverid;
	}
	public void setMessage_receiverid(String message_receiverid) {
		this.message_receiverid = message_receiverid;
	}
	public String getMessage_senderid() {
		return message_senderid;
	}
	public void setMessage_senderid(String message_senderid) {
		this.message_senderid = message_senderid;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public String getMessage_context() {
		return message_context;
	}
	public void setMessage_context(String message_context) {
		this.message_context = message_context;
	}
	public Date getMessage_datesent() {
		return message_datesent;
	}
	public void setMessage_datesent(Date message_datesent) {
		this.message_datesent = message_datesent;
	}
	public Date getMessage_datereceived() {
		return message_datereceived;
	}
	public void setMessage_datereceived(Date message_datereceived) {
		this.message_datereceived = message_datereceived;
	}
	public String getMessage_read() {
		return message_read;
	}
	public void setMessage_read(String message_read) {
		this.message_read = message_read;
	}
	public String getMessage_isdeletedbyreceiver() {
		return message_isdeletedbyreceiver;
	}
	public void setMessage_isdeletedbyreceiver(String message_isdeletedbyreceiver) {
		this.message_isdeletedbyreceiver = message_isdeletedbyreceiver;
	}
	public String getMessage_isdeletedbysender() {
		return message_isdeletedbysender;
	}
	public void setMessage_isdeletedbysender(String message_isdeletedbysender) {
		this.message_isdeletedbysender = message_isdeletedbysender;
	}
	public String getMessage_hide() {
		return message_hide;
	}
	public void setMessage_hide(String message_hide) {
		this.message_hide = message_hide;
	}

		
}
