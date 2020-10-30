package com.nusang.dao;

import com.nusang.dto.Post_Picture;

public class Post_PictureDao extends BasicDao<Post_Picture> {

	private static Post_PictureDao instance;

	public static Post_PictureDao getInstance() {

		if (instance == null) { // mapper의 namespace
			instance = new Post_PictureDao("post_pictureMapper.");
		}

		return instance;
	}

	private Post_PictureDao(String namespace) {
		super(namespace, "post_picno");
	}

}
