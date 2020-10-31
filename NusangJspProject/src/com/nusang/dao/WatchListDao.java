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

public class WatchListDao extends BasicDao<Payment_Market> {

	private static WatchListDao instance;

	public static WatchListDao getInstance() {

		if (instance == null) { // mapper의 namespace
			instance = new WatchListDao("watchListMapper.");
		}

		return instance;
	}

	private WatchListDao(String namespace) {
		super(namespace,"watchlistno");
	}

	
	
	
}
