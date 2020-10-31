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
		super(namespace, "reserno");
	}

	public int insertReser(Buy_Reservation br, int postno) {
		SqlSession session = sqlSessionFactory.openSession();
		int result = 0;
		try {

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("state", br.getState());
			map.put("reser_price", br.getReser_price());
			map.put("postno", postno);
			map.put("userno", br.getUser().getUserno());
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

	public int cancelReservation(int postno, int reserno) {

		SqlSession session = sqlSessionFactory.openSession();
		int result = 0;
		try {
			updateBy(session, reserno, "state", 0);
			result = PostDao.getInstance().updateBy(session, postno, "sellstate", 0);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		return result;
	}

	public int setReservation(int postno, int reserno) {

		SqlSession session = sqlSessionFactory.openSession();
		int result = 0;
		try {

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("sellpostno", postno);
			map.put("reserno", reserno);
			session.update(namespace + "initReservation", map);
			updateBy(session, reserno, "state", 1);
			result = PostDao.getInstance().updateBy(session, postno, "sellstate", 1);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		return result;

	}
	
	public int deleteReservation(int postno, int reserno) {

		SqlSession session = sqlSessionFactory.openSession();
		int result = 0;
		try {

			deleteBy(session, reserno);
			result = PostDao.getInstance().updateBy(session, postno, "sellstate", 0);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		return result;

	}
	
	
}
