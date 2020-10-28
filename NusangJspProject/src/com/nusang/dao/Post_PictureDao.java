package com.nusang.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.ibatis.session.SqlSession;

import com.nusang.dto.Location;
import com.nusang.dto.Payment_Market;
import com.nusang.dto.User;

public class Post_PictureDao extends BasicDao<Payment_Market> {

	private static Post_PictureDao instance;

	public static Post_PictureDao getInstance() {

		if (instance == null) { // mapper의 namespace
			instance = new Post_PictureDao("post_pictureMapper.");
		}

		return instance;
	}

	private Post_PictureDao(String namespace) {
		super(namespace,"post_picno");
	}

	
	
	
	
}
