package com.nusang.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

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
		super(namespace);
	}

	public int insertPost(Post post) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postno", post.getPostno());
		map.put("title", post.getTitle());
		map.put("bodytext", post.getBodytext());
		map.put("price", post.getPrice());
		map.put("category", post.getCategory());
		return insert(map);
	}
	
	

	public User loginCheck(String userid, String password) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("password", password);
		User user = session.selectOne(namespace + "loginCheck", map);
		session.close();
		return user;
	}
}
