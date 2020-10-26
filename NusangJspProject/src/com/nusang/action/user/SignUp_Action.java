package com.nusang.action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.EActionType;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

public class SignUp_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		actionForward.setNextPath(ConAsist.URL_LOGIN);
		request.setCharacterEncoding("UTF-8");
		System.out.println("회원가입 세상으로 이동");
		User signupUser = new User();
		signupUser.setUserid(request.getParameter("userid"));
		signupUser.setPassword(request.getParameter("password"));
		signupUser.setUsername(request.getParameter("username"));
		signupUser.setEmail(request.getParameter("email"));
		signupUser.setRole("ROLE_USER");
		signupUser.setLogintype("NORMAL");

		System.out.println(signupUser.getUserid());
		System.out.println(signupUser.getPassword());
		System.out.println(signupUser.getUsername());
		System.out.println(signupUser.getEmail());
		System.out.println(signupUser.getRole());
		System.out.println(signupUser.getLogintype());
		
		System.out.println("db저장된 유저 정보: " + UserDao.getInstance().selectAll());
		
		UserDao.getInstance().insertUser(signupUser); //유저 추가

		User user = UserDao.getInstance().findBy("userid", signupUser.getUserid());

		System.out.println("추가된 유저이름: " + user.getUsername());

		actionForward.setActionType(EActionType.REDIRECT);
		return actionForward;
		
	}

}
