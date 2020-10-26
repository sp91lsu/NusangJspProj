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
import com.nusang.action.user.SignUp_Action;
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
			case "id_chk" : 
				request.setCharacterEncoding("UTF-8");
				System.out.println("id중복체크 세상으로 이동");
				break;
			case "signup":
				SignUp_Action S_A = new SignUp_Action();
				actionForward = S_A.execute(request, response);
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
