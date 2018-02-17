package com.web.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.dao.QnaboardDao;
import com.web.model.QnAboardVO;
import com.web.model.UserVO;
import com.web.service.QnaboardService;

@Service("qnaboardService")
public class QnaboardServiceImpl implements QnaboardService {
	
	@Resource(name="qnaboardDao")
	private QnaboardDao qnaboardDao;

	@Override
	public List<QnAboardVO> listQnaBoard() {
		// TODO Auto-generated method stub
		return qnaboardDao.listQnaBoard();
	}

	@Override
	public int insertQnaBoard(QnAboardVO dto) {
		// TODO Auto-generated method stub
		return qnaboardDao.insertQnaBoard(dto);
	}

	@Override
	public int readCount(int qnaboard_no) {
		// TODO Auto-generated method stub
		return qnaboardDao.readCount(qnaboard_no);
	}

	@Override
	public int updateRecnt(int qnaboard_no) {
		// TODO Auto-generated method stub
		return qnaboardDao.updateRecnt(qnaboard_no);
	}

	@Override
	public int DeupdateRecnt(int qnaboard_no) {
		// TODO Auto-generated method stub
		return qnaboardDao.DeupdateRecnt(qnaboard_no);
	}

	@Override
	public QnAboardVO getQnaBoard(int qnaboard_no) {
		// TODO Auto-generated method stub
		return qnaboardDao.getQnaBoard(qnaboard_no);
	}

	@Override
	public boolean isPasswordCorrect(int qnaboard_no, String passwd) {
		// TODO Auto-generated method stub
		return qnaboardDao.isPasswordCorrect(qnaboard_no, passwd);
	}

	@Override
	public int deleteQnaBoard(int qnaboard_no) {
		// TODO Auto-generated method stub
		return qnaboardDao.deleteQnaBoard(qnaboard_no);
	}

	@Override
	public int updateQnaBoard(QnAboardVO dto) {
		// TODO Auto-generated method stub
		return qnaboardDao.updateQnaBoard(dto);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return qnaboardDao.getCount();
	}

	@Override
	public List<UserVO> getAllQnaBoard(int startRow, int endRow) {
		// TODO Auto-generated method stub
		return qnaboardDao.getAllQnaBoard(startRow, endRow);
	}

	@Override
	public List<UserVO> search(String searchOption, String searchString, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return qnaboardDao.search(searchOption, searchString, startRow, endRow);
	}

	@Override
	public int getCountByCondition(String searchOption, String searchString) {
		// TODO Auto-generated method stub
		return qnaboardDao.getCountByCondition(searchOption, searchString);
	}
	
	

}
