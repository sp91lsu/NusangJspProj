package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.Buy_ReservationDao;
import com.nusang.dao.PostDao;
import com.nusang.dto.Post;

public class ReadPost_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int postNo = Integer.parseInt(request.getParameter("postno"));
		Post post = PostDao.getInstance().findBy("postno",postNo );
		//Buy_ReservationDao.getInstance().setReserList(post);
		request.setAttribute("post", post);
		ActionForward acf = new ActionForward();
		acf.setNextPath("/4_post/readPost.jsp");
		return acf;
	}

}
