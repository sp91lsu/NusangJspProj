package com.nusang.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.account.LoginAction;
import com.nusang.action.myinfo.ProfileAction;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dto.User;

@WebServlet("/myinfo/*")
public class MyInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Action action = null;
		ActionForward actionForward = null;
		actionForward = ConAsist.checkLogin(request);
		if (actionForward == null) { // http://localhost:8787/myinfo/profile
			String requestPage = ConAsist.getRequestName(request);
			// profile
			try {
				switch (requestPage) {
				case "profile":
					action = new ProfileAction();
					actionForward = action.execute(request, response);
					//
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (actionForward != null)

		{
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
