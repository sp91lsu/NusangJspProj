package com.nusang.action.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.PostDao;
import com.nusang.dto.Post;

public class Index_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Post> postList = PostDao.getInstance().selectAll();
		request.setAttribute("arr", postList);
		ActionForward acf = new ActionForward();
		acf.setNextPath(ConAsist.URL_MAIN2);
		return acf;
	}

}
