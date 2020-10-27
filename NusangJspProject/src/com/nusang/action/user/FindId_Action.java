package com.nusang.action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

public class FindId_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		actionForward.setNextPath(ConAsist.URL_LOGIN);
		request.setCharacterEncoding("UTF-8");
		System.out.println("아이디 찾기 세상으로 이동");

		String username = request.getParameter("username");
		String email = request.getParameter("email");

		System.out.println(username);
		System.out.println(email);
		User user = UserDao.getInstance().idCheck(username, email);
		System.out.println(user);
		String resText = "";
		if (user != null) {
			if (user.getLogintype().equals("NORMAL")) {
				resText = "해당 메일로 아이디를 보냈습니다.";
			}else {
				resText = "해당 계정은 소셜계정입니다.";
			}
		} else {
			resText = "정보와 일치하는 사용자가 없습니다.";
		}

		actionForward.setAsyncData(resText);
		return actionForward;
	}

}
