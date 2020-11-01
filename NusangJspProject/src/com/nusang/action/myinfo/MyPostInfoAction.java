package com.nusang.action.myinfo;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.PostDao;
import com.nusang.dto.Post;
import com.nusang.dto.User;

public class MyPostInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		User user = ConAsist.getSessionUser(request);

		ArrayList<Post> myPostList = (ArrayList<Post>) PostDao.getInstance().findByList("userno", user.getUserno());

		request.setAttribute("myPostList", myPostList);
		ActionForward af = new ActionForward();
		af.setNextPath(ConAsist.URL_MYINFOMAIN + "?sidemenu=myPostList.jsp");
		return af;
	}

}
