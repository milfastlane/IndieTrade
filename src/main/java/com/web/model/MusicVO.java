package com.web.model;

public class MusicVO {
	
	private int music_no;
	private String music_name;
	private String music_mvlink;
	private String music_artistname;
	private String music_musicboardname;
	private int music_musicboardno; //== musicBoard_no
	private String music_filename; 
	private String musicboard_imgname;
	private String musicboard_name;
	
	
	public String getMusicboard_name() {
		return musicboard_name;
	}
	public void setMusicboard_name(String musicboard_name) {
		this.musicboard_name = musicboard_name;
	}
	public String getMusicboard_imgname() {
		return musicboard_imgname;
	}
	public void setMusicboard_imgname(String musicboard_imgname) {
		this.musicboard_imgname = musicboard_imgname;
	}
	public String getMusic_filename() {
		return music_filename;
	}
	public void setMusic_filename(String music_filename) {
		this.music_filename = music_filename;
	}
	public int getMusic_no() {
		return music_no;
	}
	public void setMusic_no(int music_no) {
		this.music_no = music_no;
	}
	public String getMusic_name() {
		return music_name;
	}
	public void setMusic_name(String music_name) {
		this.music_name = music_name;
	}
	public String getMusic_mvlink() {
		return music_mvlink;
	}
	public void setMusic_mvlink(String music_mvlink) {
		this.music_mvlink = music_mvlink;
	}
	public String getMusic_artistname() {
		return music_artistname;
	}
	public void setMusic_artistname(String music_artistname) {
		this.music_artistname = music_artistname;
	}
	public String getMusic_musicboardname() {
		return music_musicboardname;
	}
	public void setMusic_musicboardname(String music_musicboardname) {
		this.music_musicboardname = music_musicboardname;
	}
	public int getMusic_musicboardno() {
		return music_musicboardno;
	}
	public void setMusic_musicboardno(int music_musicboardno) {
		this.music_musicboardno = music_musicboardno;
	}
	
	
}
