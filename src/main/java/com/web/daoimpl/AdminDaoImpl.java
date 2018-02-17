package com.web.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.dao.AdminDao;
import com.web.model.CategoryVO;
import com.web.model.MusicboardVO;
import com.web.model.UserVO;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertCategory(CategoryVO dto) {
		return sqlSession.insert("insertCategory", dto);
	}
	@Override
	public List<CategoryVO> listCategory() {
		return sqlSession.selectList("listCategory");
	}
	@Override
	public int countUsers() {
		return sqlSession.selectOne("countUsers");
	}
	
	@Override
	public void plusVisit() {
		sqlSession.insert("plusVisit");
	}
	
	@Override
	public int countVisit() {
		int visitTotal = sqlSession.selectOne("countVisit");
		return visitTotal;
	}
	
	@Override
	public int countVisit_today() {
		int visitTotal_today = sqlSession.selectOne("countVisit_today");
		return visitTotal_today;
	}

	@Override
	public List<UserVO> listUser(){
		List<UserVO> list = sqlSession.selectList("listUser");
		return list;
	}
	@Override
	public List<UserVO> listUsername(){
	
		List<UserVO> list = sqlSession.selectList("listUsername");
		return list;
	}
	@Override
	public int getCount() {
		int no = sqlSession.selectOne("getCount");
		return no;
	}
	@Override
	public int getCount2() {
		int no = sqlSession.selectOne("getCount2");
		return no;
	}
	@Override
	public int getCount_category() {
		int no = sqlSession.selectOne("getCount_category");
		return no;
	}

	@Override
	public int getCount_artist() {
		int no = sqlSession.selectOne("getCounta");
		return no;
	}
	@Override
	public int getCount_fan() {
		int no = sqlSession.selectOne("getCountb");
		return no;
	}
	
	

	@Override
	public List<UserVO> getAllMember(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", startRow);
		map.put("end", endRow);
		List<UserVO> list = sqlSession.selectList("listAllUser", map);

		return list;
	}
	@Override
	public List<UserVO> getAllUnregistered(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", startRow);
		map.put("end", endRow);
		List<UserVO> list = sqlSession.selectList("listAllUnregistered", map);

		return list;
	}
	@Override
	public List<UserVO> getAllArtist(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", startRow);
		map.put("end", endRow);
		List<UserVO> list = sqlSession.selectList("listAllArtist", map);

		return list;
	}
	@Override
	public List<UserVO> getAllFan(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", startRow);
		map.put("end", endRow);
		List<UserVO> list = sqlSession.selectList("listAllFan", map);

		return list;
	}
	@Override
	public CategoryVO getCategory(int num) {
		CategoryVO dto = null;
		dto = (CategoryVO)sqlSession.selectOne("getCategory", num);
		return dto;

	}
	@Override
	public int updateCategory(CategoryVO dto) {
		
		return sqlSession.update("updateCategory", dto);

	}
	@Override
	public int deleteCategory(int no) {
		
		return sqlSession.delete("deleteCategory", no);

	}
	@Override
	public List<UserVO> allMusic_admin(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", startRow);
		map.put("end", endRow);
		List<UserVO> list = sqlSession.selectList("allMusic_admin", map);

		return list;
	}
	@Override
	public List<UserVO> allMusicBoard_admin(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", startRow);
		map.put("end", endRow);
		List<UserVO> list = sqlSession.selectList("allMusicBoard_admin", map);

		return list;
	}
	@Override
	public List<UserVO> allSns_admin(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", startRow);
		map.put("end", endRow);
		List<UserVO> list = sqlSession.selectList("allSns_admin", map);

		return list;
	}
	@Override
	public int getCountByCond(String searchOption, String searchString) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("searchOption", searchOption);
				map.put("searchString", searchString);
				int no = sqlSession.selectOne("getCountByCond", map);

				return no;
	}
	@Override
	public int getCountByCond2(String searchString) {
	
				int no = sqlSession.selectOne("getCountByCond2", searchString);

				return no;
	}
	@Override
	public List<UserVO> membersearch(String searchOption, String searchString, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(searchOption!=null && searchString==null) {
			map.put("searchOption", null);
			map.put("searchString", (String)"");
		}else {
			map.put("searchOption", (String)searchOption);
			map.put("searchString", (String)searchString);
		}
		map.put("start", (int)startRow);
		map.put("end", (int)endRow);

		List<UserVO> list = sqlSession.selectList("listMemberByCond", map);

		return list;
	}
	@Override
	public List<UserVO> unregisteredsearch(String searchString, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(searchString==null) {
			map.put("searchString", (String)"");
		}else {
			map.put("searchString", (String)searchString);
		}
		map.put("start", (int)startRow);
		map.put("end", (int)endRow);

		List<UserVO> list = sqlSession.selectList("listUnregisteredByCond", map);

		return list;
	}
	@Override
	public List<UserVO> receivedmessagesearch(String adminid, String searchString, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("adminid", adminid);
		map.put("searchString", (String)searchString);
	
		map.put("start", (int)startRow);
		map.put("end", (int)endRow);

		List<UserVO> list = sqlSession.selectList("listReceivedMessageByCond", map);

		
		return list;
	}
	@Override
	public List<UserVO> receivedmessagesearch_user(String userid, String searchString, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("searchString", (String)searchString);
	
		map.put("start", (int)startRow);
		map.put("end", (int)endRow);

		List<UserVO> list = sqlSession.selectList("listReceivedMessageByCond_user", map);

		
		return list;
	}
	@Override
	public List<UserVO> sentmessagesearch(String adminid, String searchString, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("adminid", adminid);
		map.put("searchString", (String)searchString);
	
		map.put("start", (int)startRow);
		map.put("end", (int)endRow);

		List<UserVO> list = sqlSession.selectList("listSentMessageByCond", map);

		
		return list;
	}
	@Override
	public int terminateuser(int user_no) {
		int res = sqlSession.delete("terminateuser", user_no);
		return res;
	}
	@Override
	public List<MusicboardVO> musicboardList(){
		List<MusicboardVO> list = sqlSession.selectList("listMusicboard");
		return list;
	}
	@Override
	public int countMusics() {
		return sqlSession.selectOne("countMusics");
	}

}
