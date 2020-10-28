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

public class ReplyDao extends BasicDao<Payment_Market> {

	private static ReplyDao instance;

	public static ReplyDao getInstance() {

		if (instance == null) { // mapper의 namespace
			instance = new ReplyDao("replyMapper.");
		}

		return instance;
	}

	private ReplyDao(String namespace) {
		super(namespace,"ph_userno");
	}
	
	
	
	
	
}
