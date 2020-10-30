package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.Buy_ReservationDao;

public class CancelReserVationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int reserno = Integer.parseInt(request.getParameter("reserno"));

		Integer result = Buy_ReservationDao.getInstance().updateBy(reserno, "state", 0);
		ActionForward af = new ActionForward();

		af.setAsyncData(result.toString());
		return af;

	}

}
