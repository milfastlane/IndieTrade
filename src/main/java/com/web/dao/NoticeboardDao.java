package com.web.dao;

import java.util.List;

import com.web.model.NoticeboardVO;

public interface NoticeboardDao {
	
	List<NoticeboardVO> listNoticeBoard(int startRow, int endRow);
	int insertNoticeBoard(NoticeboardVO dto);
	int readCount(int bno);
	NoticeboardVO getNoticeBoard(int bno);
	int deleteNoticeBoard(int num);
	int getCount();
	int resetRepresentingNotice();
	int setRepresentingNotice(int noticeboard_no);
	NoticeboardVO getRepresentingNoticeBoard();
	
}
