package com.web.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.web.dao.AdminDao;
import com.web.model.CategoryVO;
import com.web.model.MusicboardVO;
import com.web.model.UserVO;
import com.web.service.AdminService;


@Service("adminService") 
public class AdminServiceImpl implements AdminService{
	
	@Resource(name="adminDao")
	private AdminDao adminDao;

	@Override
	public int insertCategory(CategoryVO dto) {
		
		return adminDao.insertCategory(dto);
	}

	@Override
	public List<CategoryVO> listCategory() {
		
		return adminDao.listCategory();
	}

	@Override
	public int countUsers() {
		
		return adminDao.countUsers();
	}

	@Override
	public void plusVisit() {
		
		adminDao.plusVisit();
	}

	@Override
	public int countVisit() {
		
		return adminDao.countVisit();
	}

	@Override
	public int countVisit_today() {
		
		return adminDao.countVisit_today();
	}

	@Override
	public List<UserVO> listUser() {
		
		return adminDao.listUser();
	}

	@Override
	public List<UserVO> listUsername() {
		
		return adminDao.listUsername();
	}

	@Override
	public int getCount() {
		
		return adminDao.getCount();
	}

	@Override
	public int getCount2() {
		
		return adminDao.getCount2();
	}

	@Override
	public int getCount_category() {
		
		return adminDao.getCount_category();
	}

	@Override
	public int getCount_artist() {
		
		return adminDao.getCount_artist();
	}

	@Override
	public int getCount_fan() {
		
		return adminDao.getCount_fan();
	}

	@Override
	public List<UserVO> getAllMember(int startRow, int endRow) {
		
		return adminDao.getAllMember(startRow, endRow);
	}

	@Override
	public List<UserVO> getAllUnregistered(int startRow, int endRow) {
		
		return adminDao.getAllUnregistered(startRow, endRow);
	}

	@Override
	public List<UserVO> getAllArtist(int startRow, int endRow) {
		
		return adminDao.getAllArtist(startRow, endRow);
	}

	@Override
	public List<UserVO> getAllFan(int startRow, int endRow) {
		
		return adminDao.getAllFan(startRow, endRow);
	}

	@Override
	public CategoryVO getCategory(int num) {
		
		return adminDao.getCategory(num);
	}

	@Override
	public int updateCategory(CategoryVO dto) {
		
		return adminDao.updateCategory(dto);
	}

	@Override
	public int deleteCategory(int no) {
		
		return adminDao.deleteCategory(no);
	}

	@Override
	public List<UserVO> allMusic_admin(int startRow, int endRow) {
		
		return adminDao.allMusic_admin(startRow, endRow);
	}

	@Override
	public List<UserVO> allMusicBoard_admin(int startRow, int endRow) {
		
		return adminDao.allMusicBoard_admin(startRow, endRow);
	}

	@Override
	public List<UserVO> allSns_admin(int startRow, int endRow) {
		
		return adminDao.allSns_admin(startRow, endRow);
	}

	@Override
	public int getCountByCond(String searchOption, String searchString) {
		
		return adminDao.getCountByCond(searchOption, searchString);
	}

	@Override
	public int getCountByCond2(String searchString) {
		
		return adminDao.getCountByCond2(searchString);
	}

	@Override
	public List<UserVO> membersearch(String searchOption, String searchString, int startRow, int endRow) {
		
		return adminDao.membersearch(searchOption, searchString, startRow, endRow);
	}

	@Override
	public List<UserVO> unregisteredsearch(String searchString, int startRow, int endRow) {
		
		return adminDao.unregisteredsearch(searchString, startRow, endRow);
	}

	@Override
	public List<UserVO> receivedmessagesearch(String adminid, String searchString, int startRow, int endRow) {
		
		return adminDao.receivedmessagesearch(adminid, searchString, startRow, endRow);
	}

	@Override
	public List<UserVO> receivedmessagesearch_user(String userid, String searchString, int startRow, int endRow) {
		
		return adminDao.receivedmessagesearch_user(userid, searchString, startRow, endRow);
	}

	@Override
	public List<UserVO> sentmessagesearch(String adminid, String searchString, int startRow, int endRow) {
		
		return adminDao.sentmessagesearch(adminid, searchString, startRow, endRow);
	}

	@Override
	public int terminateuser(int user_no) {
		
		return adminDao.terminateuser(user_no);
	}

	@Override
	public List<MusicboardVO> musicboardList() {
		
		return adminDao.musicboardList();
	}

	@Override
	public int countMusics() {
		
		return adminDao.countMusics();
	}
	
	
	
	

}
