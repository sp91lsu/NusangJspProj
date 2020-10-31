package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.Buy_ReservationDao;
import com.nusang.dao.PostDao;

public class DeleteReserVationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int reserno = Integer.parseInt(request.getParameter("reserno"));
		int postno = Integer.parseInt(request.getParameter("postno"));
		Integer result = Buy_ReservationDao.getInstance().deleteReservation(postno,reserno);
		ActionForward af = new ActionForward();

		af.setAsyncData(result.toString());
		return af;

	}

}
