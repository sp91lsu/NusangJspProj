package com.nusang.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.ActionForward;
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

		List<User> userList = UserDao.getInstance().selectAll();
		User user = UserDao.getInstance().findByUUid(2);

		System.out.println("list : " + userList);
		System.out.println("user : " + user);

		ActionForward actionForward = null;

		String requestURI = request.getRequestURI();
		int lstindex = requestURI.lastIndexOf("/") + 1;

		String requestPage = requestURI.substring(lstindex);

		try {
			switch (requestPage) {
			case "login.do":

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
