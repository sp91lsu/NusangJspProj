package com.nusang.action.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.bo.Mail;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

public class FindPw_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		System.out.println("비밀번호 찾기 세상으로 이동");

		String username = request.getParameter("username");
		String userid = request.getParameter("userid");
		String email = request.getParameter("email");

		System.out.println(username);
		System.out.println(userid);
		System.out.println(email);

		List<User> userList = UserDao.getInstance().pwCheck(username, userid, email);

		String resText = "";
		if (userList != null && userList.size() > 0) {
			resText = "해당 메일로 비밀번호를 보냈습니다.";
			for (User user : userList) {
				Mail.sendMail(user.getEmail(), "너근마켓 비밀번호 찾기", user.getUserid() + " 너근마켓 비밀번호 : " + user.getPassword());
			}
		} else {
			resText = "정보와 일치하는 사용자가 없습니다.";
		}

		actionForward.setAsyncData(resText);
		return actionForward;
	}

}
