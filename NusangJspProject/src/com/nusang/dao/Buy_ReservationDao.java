package com.nusang.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.ibatis.session.SqlSession;

import com.nusang.dto.Buy_Reservation;
import com.nusang.dto.Location;
import com.nusang.dto.Payment_Market;
import com.nusang.dto.Post;
import com.nusang.dto.Reser_Object;
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
		super(namespace, "ph_userno");
	}

	public int insertReser(Buy_Reservation br, int postno) {
		SqlSession session = sqlSessionFactory.openSession();
		int result = 0;
		try {

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("state", br.getState());
			map.put("reser_price", br.getReser_price());
			map.put("postno", postno);
			map.put("userno", br.getUserno());
			map.put("sellpostno", postno);

			result = session.insert(namespace + "insert", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		return result;
	}


	public void setReserList(Post post) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Reser_Object> reser_list = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userOrPost", "NUSER.userno");
			map.put("no", post.getPostno());
			reser_list = session.selectList(namespace + "findReserList", map);
			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		post.setReservationList((ArrayList) reser_list);
	}

	public void setReserList(User user) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Reser_Object> reser_list = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userOrPost", "SELLPOST.postno");
			map.put("no", user.getUserno());
			reser_list = session.selectList(namespace + "findReserList", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		user.setReservationList((ArrayList) reser_list);
	}

}
