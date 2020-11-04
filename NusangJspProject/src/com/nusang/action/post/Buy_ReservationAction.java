package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.Buy_ReservationDao;
import com.nusang.dao.WatchListDao;
import com.nusang.dto.Buy_Reservation;
import com.nusang.dto.Post;
import com.nusang.dto.User;

public class Buy_ReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Buy_Reservation br = new Buy_Reservation();
		User user = ConAsist.getSessionUser(request);
		int postno = Integer.parseInt(request.getParameter("reser_postno"));
		int reser_price = Integer.parseInt(request.getParameter("reser_price"));
		br = Buy_Reservation.builder().user(user).reser_price(reser_price).state(0).build();
		Integer result = Buy_ReservationDao.getInstance().insertReser(br,postno);

		ActionForward af = new ActionForward();

		af.setAsyncData(result.toString());
		return af;
	}
}
