package com.nusang.dao;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.nusang.dto.Location;
import com.nusang.dto.Post;
import com.nusang.dto.User;

public class PostDao extends BasicDao<Post> {

	private static PostDao instance;

	public static PostDao getInstance() {

		if (instance == null) { // mapper의 namespace
			instance = new PostDao("postMapper.");
		}

		return instance;
	}

	private PostDao(String namespace) {
		super(namespace, "postno");
	}

	public int insertPost(Post post) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", post.getTitle());
		map.put("bodytext", post.getBodytext());
		map.put("price", post.getPrice());
		map.put("category", post.getCategory());
		int result = insert(session, map);
		session.commit();
		session.close();
		return result;
	}

	public ArrayList<Post> findPostByLocation(Location userLocation,int distance) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("lat : " + userLocation.getLatitude());
		System.out.println("long : " + userLocation.getLongtitude());
		map.put("latitude", userLocation.getLatitude());
		map.put("longtitude", userLocation.getLongtitude());
		map.put("distance", distance);
		List<Post> postList = session.selectList(namespace + "findPostByLocation",map);
		session.commit();
		session.close();
		return (ArrayList<Post>) postList;
	}
}
