package com.nusang.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.EActionType;
import com.nusang.action.account.LoginAction;
import com.nusang.action.account.SetLocationAction;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

@WebServlet("/user/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Action action = null;
		ActionForward actionForward = new ActionForward();
		String requestPage = ConAsist.getRequestName(request);

		try {
			switch (requestPage) {
			case "set_location":
				action = new SetLocationAction();
				actionForward = action.execute(request, response);
				break;
			case "login":
			case "kakaologin":
			case "naverlogin":
				action = new LoginAction();
				actionForward = action.execute(request, response);
				break;
			case "signup":
				request.setCharacterEncoding("UTF-8");
				actionForward = new ActionForward();
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
				UserDao.getInstance().insertUser(signupUser);

				User user = UserDao.getInstance().findBy("userid", signupUser.getUserid());

				System.out.println("추가된 유저이름: " + user.getUsername());

				actionForward.setNextPath(ConAsist.URL_LOGIN);

				actionForward.setActionType(EActionType.REDIRECT);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		actionForward.moveUrl(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
