package com.nusang.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.nusang.dto.User;

import sqlmap.SqlSessionManager;

public class UserDao {

	private static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getInstance();

	private static UserDao instance;

	public static UserDao getInstance() {

		if (instance == null) {
			instance = new UserDao();
		}

		return instance;
	}

	public List<User> selectAll() {
		SqlSession session = sqlSessionFactory.openSession();
		List<User> list = null;
		list = session.selectList("selectAll");
		session.close();
		return list;
	}

	//where 바로 뒤에 검색하고자 하는 검색어는 ${}, 키워드는 #{}
	//예 : select * from 테이블 where ${search} = #{keyword}
	public User findByUUid(int uuid) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", "uuid");
		map.put("keyword", uuid);
		User user = session.selectOne("findBy", map);
		session.close();
		return user;
	}

	public User findByUsername(String username) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", "username");
		map.put("keyword", username);
		User user = session.selectOne("findBy", map);
		session.close();
		return user;
	}

	public int insert(User user) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uuid", user.getUuid());
		map.put("password", user.getPassword());
		map.put("userid", user.getUserid());
		map.put("username", user.getUsername());
		map.put("role", user.getRole());
		// uuid,userid,username,password,role
		int result = session.insert("insertUser", map);
		session.commit();
		session.close();
		return 0;
	}

}
