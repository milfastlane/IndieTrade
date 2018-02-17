package com.web.model;

import java.util.Date;

public class ReplyVO {
	private int reply_no;
	private int qnaboard_no;
	private String reply_text;
	private String reply_writer;
	private Date reply_regdate;
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getQnaboard_no() {
		return qnaboard_no;
	}
	public void setQnaboard_no(int qnaboard_no) {
		this.qnaboard_no = qnaboard_no;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public String getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	public Date getReply_regdate() {
		return reply_regdate;
	}
	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}


    
}
