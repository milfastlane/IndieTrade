package com.web.dao;

import java.util.List;

import com.web.model.CategoryVO;
import com.web.model.MusicboardVO;
import com.web.model.UserVO;

public interface AdminDao {
	
	int insertCategory(CategoryVO dto);
	List<CategoryVO> listCategory();
	int countUsers();
	int countMusics();
	void plusVisit();
	int countVisit();
	int countVisit_today();
	List<UserVO> listUser();
	List<UserVO> listUsername();
	int getCount();
	int getCount2();
	int getCount_category();
	int getCount_artist();
	int getCount_fan();
	List<UserVO> getAllMember(int startRow, int endRow);
	List<UserVO> getAllUnregistered(int startRow, int endRow);
	List<UserVO> getAllArtist(int startRow, int endRow);
	List<UserVO> getAllFan(int startRow, int endRow);
	CategoryVO getCategory(int num);
	int updateCategory(CategoryVO dto);
	int deleteCategory(int no);
	List<UserVO> allMusic_admin(int startRow, int endRow);
	List<UserVO> allMusicBoard_admin(int startRow, int endRow);
	List<UserVO> allSns_admin(int startRow, int endRow);
	int getCountByCond(String searchOption, String searchString);
	int getCountByCond2(String searchString);
	List<UserVO> membersearch(String searchOption, String searchString, int startRow, int endRow);
	List<UserVO> unregisteredsearch(String searchString, int startRow, int endRow);
	List<UserVO> receivedmessagesearch(String adminid, String searchString, int startRow, int endRow);
	List<UserVO> receivedmessagesearch_user(String userid, String searchString, int startRow, int endRow);
	List<UserVO> sentmessagesearch(String adminid, String searchString, int startRow, int endRow);
	int terminateuser(int user_no);
	List<MusicboardVO> musicboardList();

	
}
