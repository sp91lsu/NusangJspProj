package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.PostDao;
import com.nusang.dto.Post;

public class CreatePost_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Post post = new Post();
		request.setCharacterEncoding("UTF-8");
		post.setTitle(request.getParameter("title"));
		post.setCategory(request.getParameter("category"));
		post.setPrice(Long.parseLong(request.getParameter("price")));
		post.setBodytext(request.getParameter("bodytext"));
		int insertResult = PostDao.getInstance().insertPost(post);
		request.setAttribute("result", insertResult);
		ActionForward acf = new ActionForward();
		acf.setNextPath("/4_post/createOk.jsp");
		return acf;
	}

}
