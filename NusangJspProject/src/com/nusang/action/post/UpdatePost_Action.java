package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.PostDao;
import com.nusang.dto.Post;

public class UpdatePost_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int postNo = Integer.parseInt(request.getParameter("postno"));
		Post post = PostDao.getInstance().findBy("postno",postNo );
		request.setAttribute("post", post);
		ActionForward acf = new ActionForward();
		acf.setNextPath(ConAsist.URL_UPDATEPOST);
		return acf;
	}

}
