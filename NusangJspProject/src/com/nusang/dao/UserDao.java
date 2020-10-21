package com.nusang.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.nusang.dto.User;

public class UserDao extends BasicDao<User> {

	private static UserDao instance;

	public static UserDao getInstance() {

		if (instance == null) {   //mapper의 namespace
			instance = new UserDao("userMapper.");
		}

		return instance;
	}

	private UserDao(String namespace) {
		super(namespace);
	}

	public int insertUser(User user) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", user.getUserid());
		map.put("password", user.getPassword());
		map.put("userid", user.getUserid());
		map.put("username", user.getUsername());
		map.put("role", user.getRole());
		map.put("logintype", user.getLogintype());
		map.put("location", user.getLocation());
		// uuid,userid,username,password,role
		return insert(session, map);

	}

}
