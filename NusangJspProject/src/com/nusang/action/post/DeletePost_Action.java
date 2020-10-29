package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.Buy_ReservationDao;
import com.nusang.dao.PostDao;
import com.nusang.dto.Post;

public class DeletePost_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String postNo = request.getParameter("postno");
		PostDao.getInstance().deletePost(postNo);
		ActionForward acf = new ActionForward();
		acf.setNextPath(ConAsist.URL_MAIN);
		return acf;
	}

}
