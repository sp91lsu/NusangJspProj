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
	
	public User findByUUid(int methoduuid) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("queryuuid", methoduuid);
		User user = session.selectOne("findByUUid",map);
		
		session.close();
		return user;
	}
	
	
	
}
