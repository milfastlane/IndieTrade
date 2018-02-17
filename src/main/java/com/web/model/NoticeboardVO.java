package com.web.model;

import java.util.Date;

public class NoticeboardVO {
	
	private int noticeboard_no;
	private String noticeboard_title;
	private String noticeboard_content;
	private Date noticeboard_regdate;
	private int noticeboard_viewcnt;
	private int noticeboard_represent; 
	
	public int getNoticeboard_no() {
		return noticeboard_no;
	}
	public void setNoticeboard_no(int noticeboard_no) {
		this.noticeboard_no = noticeboard_no;
	}
	public String getNoticeboard_title() {
		return noticeboard_title;
	}
	public void setNoticeboard_title(String noticeboard_title) {
		this.noticeboard_title = noticeboard_title;
	}
	public String getNoticeboard_content() {
		return noticeboard_content;
	}
	public void setNoticeboard_content(String noticeboard_content) {
		this.noticeboard_content = noticeboard_content;
	}
	public Date getNoticeboard_regdate() {
		return noticeboard_regdate;
	}
	public void setNoticeboard_regdate(Date noticeboard_regdate) {
		this.noticeboard_regdate = noticeboard_regdate;
	}
	public int getNoticeboard_viewcnt() {
		return noticeboard_viewcnt;
	}
	public void setNoticeboard_viewcnt(int noticeboard_viewcnt) {
		this.noticeboard_viewcnt = noticeboard_viewcnt;
	}
	public int getNoticeboard_represent() {
		return noticeboard_represent;
	}
	public void setNoticeboard_represent(int noticeboard_represent) {
		this.noticeboard_represent = noticeboard_represent;
	}

	
}
