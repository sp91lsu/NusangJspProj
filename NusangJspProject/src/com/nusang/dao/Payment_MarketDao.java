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

public class Payment_MarketDao extends BasicDao<Payment_Market> {

	private static Payment_MarketDao instance;

	public static Payment_MarketDao getInstance() {

		if (instance == null) { // mapper의 namespace
			instance = new Payment_MarketDao("payment_MarketMapper.");
		}

		return instance;
	}

	private Payment_MarketDao(String namespace) {
		super(namespace);
	}

	
	
	
}
