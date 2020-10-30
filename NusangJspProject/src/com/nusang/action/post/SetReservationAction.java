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

public class SetReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int reserno = Integer.parseInt(request.getParameter("reserno"));
		int postno = Integer.parseInt(request.getParameter("postno"));

		Integer result = Buy_ReservationDao.getInstance().setReservation(postno,reserno);
		ActionForward af = new ActionForward();

		af.setAsyncData(result.toString());
		return af;
	}
}
