package com.web.model;

import java.util.Date;

public class QnAboardVO {
	private int qnaboard_no;
	private String qnaboard_title;
	private String qnaboard_content;
	private String qnaboard_passwd;
	private String qnaboard_writer;
	private Date qnaboard_regdate;
	private int qnaboard_viewcnt;
	private int qnaboard_recnt;
	
	public int getQnaboard_no() {
		return qnaboard_no;
	}
	public void setQnaboard_no(int qnaboard_no) {
		this.qnaboard_no = qnaboard_no;
	}
	public String getQnaboard_title() {
		return qnaboard_title;
	}
	public void setQnaboard_title(String qnaboard_title) {
		this.qnaboard_title = qnaboard_title;
	}
	public String getQnaboard_content() {
		return qnaboard_content;
	}
	public void setQnaboard_content(String qnaboard_content) {
		this.qnaboard_content = qnaboard_content;
	}
	public String getQnaboard_passwd() {
		return qnaboard_passwd;
	}
	public void setQnaboard_passwd(String qnaboard_passwd) {
		this.qnaboard_passwd = qnaboard_passwd;
	}
	public String getQnaboard_writer() {
		return qnaboard_writer;
	}
	public void setQnaboard_writer(String qnaboard_writer) {
		this.qnaboard_writer = qnaboard_writer;
	}
	public Date getQnaboard_regdate() {
		return qnaboard_regdate;
	}
	public void setQnaboard_regdate(Date qnaboard_regdate) {
		this.qnaboard_regdate = qnaboard_regdate;
	}
	public int getQnaboard_viewcnt() {
		return qnaboard_viewcnt;
	}
	public void setQnaboard_viewcnt(int qnaboard_viewcnt) {
		this.qnaboard_viewcnt = qnaboard_viewcnt;
	}
	public int getQnaboard_recnt() {
		return qnaboard_recnt;
	}
	public void setQnaboard_recnt(int qnaboard_recnt) {
		this.qnaboard_recnt = qnaboard_recnt;
	}





}
