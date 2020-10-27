package com.nusang.action.user;

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
		
		User user = UserDao.getInstance().pwCheck(username, userid, email);
		
		String resText = "";
		if(user != null) {
			if(user.getLogintype().equals("NORMAL")) {
				resText = "해당 메일로 비밀번호를 보냈습니다.";
				Mail.sendMail(user.getEmail(), "너근마켓 비밀번호 찾기","너근마켓 비밀번호 : " + user.getPassword());
			}else {
				resText = "해당 계정은 소셜 계정입니다.";
			}
		}else {
			resText = "정보와 일치하는 사용자 정보가 없습니다.";
		}
		
		actionForward.setAsyncData(resText);
		return actionForward;
	}

}
