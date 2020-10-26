package com.nusang.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.ibatis.session.SqlSession;

import com.nusang.dto.Location;
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
		super(namespace,"locationno");
	}

	
}
