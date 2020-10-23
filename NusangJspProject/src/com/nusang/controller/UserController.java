package com.nusang.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.account.LoginAction;
import com.nusang.controller.assistance.ConAsist;

@WebServlet("/user/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Action action = null;
		ActionForward actionForward = null;
		String requestPage = ConAsist.getRequestName(request);

		try {
			switch (requestPage) {
			case "selectAll":
//				action = new UserSelectAll();
//				actionForward = action.execute(request, response);
//				// UserDao : selectAll함수를 통해서 userList객체를 attribute에 저장 
				// actionForward : list.jsp

				break;
			case "login":
			case "kakaologin":
			case "naverlogin":

				action = new LoginAction();
				actionForward =  action.execute(request, response);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (actionForward != null) {
			if (actionForward.isRedirect()) {
				response.sendRedirect(actionForward.getNextPath());
			} else {
				request.getRequestDispatcher(actionForward.getNextPath()).forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
