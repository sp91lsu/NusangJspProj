package com.nusang.action.myinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dto.User;

public class ProfileAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		request.setAttribute("user", user);
		ActionForward af = new ActionForward();
		af.setNextPath("/4_myInfo/myInfoMain.jsp?sidemenu=profile.jsp");
		return af;
	}

}
