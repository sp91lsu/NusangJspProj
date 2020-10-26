package com.nusang.action.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.PostDao;
import com.nusang.dto.Location;
import com.nusang.dto.Post;
import com.nusang.dto.User;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward actionForward = new ActionForward();

		actionForward.setNextPath(ConAsist.URL_MAIN);
		Location location = ConAsist.getLocation(request);
		User user = (User) request.getSession().getAttribute("user");
		int distance = user == null ? 5 : user.getView_distance();

		// 근방의 게시글 가지고 오기
		List<Post> postList = PostDao.getInstance().findPostByLocation(location, distance);
		System.out.println("이 근처 " + distance + "km의 게시글 갯수 : "+ postList.size());
		request.setAttribute("postList", postList);

		return actionForward;
	}

}
