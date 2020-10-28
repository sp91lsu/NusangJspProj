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

public class Payment_UserDao extends BasicDao<Payment_Market> {

	private static Payment_UserDao instance;

	public static Payment_UserDao getInstance() {

		if (instance == null) { // mapper의 namespace
			instance = new Payment_UserDao("payment_UserMapper.");
		}

		return instance;
	}

	private Payment_UserDao(String namespace) {
		super(namespace,"ph_userno");
	}

	
	
	
}
