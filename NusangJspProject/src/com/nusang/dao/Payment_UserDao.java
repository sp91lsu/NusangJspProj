package com.nusang.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.ibatis.session.SqlSession;

import com.nusang.dto.Location;
import com.nusang.dto.Payment_Market;
import com.nusang.dto.Payment_User;
import com.nusang.dto.User;

public class Payment_UserDao extends BasicDao<Payment_User> {

	private static Payment_UserDao instance;

	public static Payment_UserDao getInstance() {

		if (instance == null) { // mapper의 namespace
			instance = new Payment_UserDao("payment_UserMapper.");
		}

		return instance;
	}

	private Payment_UserDao(String namespace) {
		super(namespace, "ph_userno");
	}

	public int updateEvaluation(int ph_userno, float star_cnt) {

		int result = 0;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			updateBy(session, ph_userno, "STAR_CNT", star_cnt);

			Payment_User pu = findByNo(ph_userno);
			
			float tot_cnt = pu.getBusiness_partner().getStar_cnt();
			float totNum = pu.getBusiness_partner().getEvaluation_cnt() + 1;

			tot_cnt += star_cnt;

			int partNo = pu.getBusiness_partner().getUserno();

			UserDao.getInstance().updateBy(session, partNo, "EVALUATION_CNT", totNum);
			result = UserDao.getInstance().updateBy(session, partNo, "STAR_CNT", tot_cnt);

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
