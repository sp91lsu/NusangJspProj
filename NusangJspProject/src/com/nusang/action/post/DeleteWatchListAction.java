package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.Buy_ReservationDao;
import com.nusang.dao.PostDao;
import com.nusang.dao.UserDao;
import com.nusang.dao.WatchListDao;
import com.nusang.dto.Post;
import com.nusang.dto.User;
import com.nusang.dto.WatchList;

public class DeleteWatchListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int postno = Integer.parseInt(request.getParameter("postno"));

		User user = ConAsist.getSessionUser(request);
		WatchList watch = user.findWatch(postno);

		Integer result = 0;
		if (watch != null) {
			result = WatchListDao.getInstance().deleteBy(watch.getWatchlistno());
		}
		ActionForward af = new ActionForward();
		af.setAsyncData(result.toString());
		return af;

	}

}
