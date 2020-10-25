package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.PostDao;
import com.nusang.dto.Post;

public class ReadBuyer_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Post post = PostDao.getInstance().findBy("postno", request.getParameter("postno"));
		request.setAttribute("post", post);
		ActionForward acf = new ActionForward();
		acf.setNextPath("/4_post/readBuyer.jsp");
		return acf;
	}

}
