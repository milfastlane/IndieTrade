package com.web.service;

import java.util.List;

import com.web.model.QnAboardVO;
import com.web.model.UserVO;

public interface QnaboardService {
	
	List<QnAboardVO> listQnaBoard();
	int insertQnaBoard(QnAboardVO dto);
	int readCount(int qnaboard_no);
	int updateRecnt(int qnaboard_no);
	int DeupdateRecnt(int qnaboard_no);
	QnAboardVO getQnaBoard(int qnaboard_no);
	boolean isPasswordCorrect(int qnaboard_no, String passwd);
	int deleteQnaBoard(int qnaboard_no);
	int updateQnaBoard(QnAboardVO dto);
	int getCount();
	List<UserVO> getAllQnaBoard(int startRow, int endRow);
	List<UserVO> search(String searchOption, String searchString, int startRow, int endRow);
	int getCountByCondition(String searchOption, String searchString);
	
}
