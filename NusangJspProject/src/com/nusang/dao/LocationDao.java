package com.nusang.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.ibatis.session.SqlSession;

import com.nusang.dto.Location;
import com.nusang.dto.Post;
import com.nusang.dto.User;

public class LocationDao extends BasicDao<Location> {

	private static LocationDao instance;

	public static LocationDao getInstance() {

		if (instance == null) { // mapper의 namespace
			instance = new LocationDao("locationMapper.");
		}

		return instance;
	}

	private LocationDao(String namespace) {
		super(namespace, "locationno");
	}

	public ArrayList<Post> findByLocation(Location location) {
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<Post> postList = new ArrayList<Post>();
		try {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("name1", location.getName1());
			map.put("name2", location.getName2());
			map.put("name3", location.getName3());
			// 유저의 동네 리스트를 다 가지고 온다.
			List<Location> locationList = session.selectList(namespace + "findByLocationName", map);

			for (Location entity : locationList) {
				Post post = PostDao.getInstance().findBy(session, "locationno", entity.getLocationno());
				postList.add(post);
			}
			session.commit();

		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return postList;
	}
}
