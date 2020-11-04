package com.nusang.action.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.bo.Mail;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

public class FindId_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		System.out.println("아이디 찾기 세상으로 이동");

		String username = request.getParameter("username");
		String email = request.getParameter("email");

		System.out.println(username);
		System.out.println(email);
		List<User> userList = UserDao.getInstance().idCheck(username, email);
		Integer res = 0;
		if (userList != null && userList.size() > 0) {
			
			for (User user : userList) {
				Mail.sendMail(user.getEmail(), "너근마켓 아이디 찾기", "너근마켓 아이디 : " + user.getUserid());
			}
			res = 1;
		} 
		actionForward.setAsyncData(res.toString());
		return actionForward;
	}

}
