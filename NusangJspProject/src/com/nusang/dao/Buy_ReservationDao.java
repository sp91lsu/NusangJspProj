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

public class Buy_ReservationDao extends BasicDao<Payment_Market> {

	private static Buy_ReservationDao instance;

	public static Buy_ReservationDao getInstance() {

		if (instance == null) { // mapper의 namespace
			instance = new Buy_ReservationDao("buy_reservationMapper.");
		}

		return instance;
	}

	private Buy_ReservationDao(String namespace) {
		super(namespace,"ph_userno");
	}

	
	
	
}
