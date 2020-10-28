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
		Post post = (Post) request.getAttribute("post");
		br = Buy_Reservation.builder().user(user).reser_price(100).state("구매신청").sellpost(post).build();
		Integer result = Buy_ReservationDao.getInstance().insertReser(br);

		ActionForward af = new ActionForward();

		af.setAsyncData(result.toString());
		return af;
	}

}
