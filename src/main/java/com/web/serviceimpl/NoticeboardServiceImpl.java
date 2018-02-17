package com.web.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.dao.NoticeboardDao;
import com.web.model.NoticeboardVO;
import com.web.service.NoticeboardService;

@Service("noticeboardService")
public class NoticeboardServiceImpl implements NoticeboardService{

	@Resource(name="noticeboardDao")
	private NoticeboardDao noticeboardDao;

	@Override
	public List<NoticeboardVO> listNoticeBoard(int startRow, int endRow){

		return noticeboardDao.listNoticeBoard(startRow, endRow);
	}
	
	@Override
	public int insertNoticeBoard(NoticeboardVO dto) {
		return noticeboardDao.insertNoticeBoard(dto);
	}
	@Override
	public int readCount(int bno) {
		return noticeboardDao.readCount(bno);
	}
	@Override
	public NoticeboardVO getNoticeBoard(int bno) {
		return noticeboardDao.getNoticeBoard(bno);
	}

	@Override
	public int deleteNoticeBoard(int num) {
		return noticeboardDao.deleteNoticeBoard(num);
	}
	@Override
	public int getCount() {
		return noticeboardDao.getCount();		
	}
	
	@Override
	public int resetRepresentingNotice() {
		return noticeboardDao.resetRepresentingNotice();
	}
	
	@Override
	public int setRepresentingNotice(int noticeboard_no) {
		return noticeboardDao.setRepresentingNotice(noticeboard_no);
	}
	
	@Override
	public NoticeboardVO getRepresentingNoticeBoard() {
		return noticeboardDao.getRepresentingNoticeBoard();
	}

	



}
