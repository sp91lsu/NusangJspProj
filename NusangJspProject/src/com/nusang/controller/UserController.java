package com.nusang.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.user.UserSelectAll;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

/**
 * Servlet implementation class UserController
 */

@WebServlet("/user/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("user");

		Action action = null;
		ActionForward actionForward = null;

		String requestURI = request.getRequestURI();
		int lstindex = requestURI.lastIndexOf("/") + 1;

		String requestPage = requestURI.substring(lstindex);

		try {
			switch (requestPage) {
			case "selectAll":
				action = new UserSelectAll();
				actionForward = action.execute(request, response);
				// UserDao : selectAll함수를 통해서 userList객체를 attribute에 저장 
				//actionForward : list.jsp
				
				
				break;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
