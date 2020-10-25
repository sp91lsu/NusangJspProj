package com.nusang.dao;

import java.beans.Transient;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import com.nusang.dto.Location;
import com.nusang.dto.User;

public class UserDao extends BasicDao<User> {

	private static UserDao instance;

	public static UserDao getInstance() {

		if (instance == null) { // mapper의 namespace
			instance = new UserDao("userMapper.");
		}

		return instance;
	}

	private UserDao(String namespace) {
		super(namespace);
	}

	public int insertUser(User user) {
		int userno = 0;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userid", user.getUserid());
			map.put("password", user.getPassword());
			map.put("username", user.getUsername());
			map.put("role", user.getRole());
			map.put("email", user.getEmail());
			map.put("logintype", user.getLogintype());
			map.put("picture", user.getPicture());
			userno = insert(session, map);
			session.commit();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("가입 실패");
			session.rollback();
		}

		return userno;

	}

	public User loginCheck(String userid, String password) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("password", password);
		User user = session.selectOne(namespace + "loginCheck", map);
		session.commit();
		session.close();
		return user;
	}

	public boolean updateLocation(int userNo, Location location) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			location.setTabletype("user");
			LocationDao.getInstance().insert(session, location);
			System.out.println("insert한 위치 값 : " + location.getLocationno());
			System.out.println("insert한 위치 값 : " + location.getLocationno());
			Location locEntity = LocationDao.getInstance().findBy(session, "locationno", location.getLocationno() - 1);
			System.out.println(locEntity.getAddress());
			updateBy(session, userNo, "locationno", locEntity.getLocationno());

			System.out.println("setLocation success");
			return true;
		} catch (Exception e) {
			System.out.println("setLocation fail");
			e.printStackTrace();
			return false;
		} finally {
			session.commit();
			session.close();
		}
	}
}
