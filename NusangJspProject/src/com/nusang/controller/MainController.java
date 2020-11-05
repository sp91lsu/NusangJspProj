package com.nusang.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.main.MainAction;
import com.nusang.action.main.SearchAction;
import com.nusang.action.main.SearchLogoutAction;
import com.nusang.controller.assistance.ConAsist;

@WebServlet({ "/main", "/index", "/" })
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Action action = null;
		ActionForward actionForward = null;
		String requestPage = ConAsist.getRequestName(request);

		try {
			switch (requestPage) {
			case "main":
				action = new MainAction();
				actionForward = action.execute(request, response);
				break;
			case "search":
				action = new SearchAction();
				actionForward = action.execute(request, response);
				break;
			case "search0":
				action = new SearchLogoutAction();
				actionForward = action.execute(request, response);
				break;
			case "index":
			case "":
				actionForward = new ActionForward();
				actionForward.setNextPath(ConAsist.URL_CHKLOCATION);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			if (request.getParameter("longitude") == null && request.getParameter("latitude") == null) {
				actionForward = new ActionForward();
				actionForward.setNextPath(ConAsist.URL_CHKLOCATION);
			}
		}

		actionForward.moveUrl(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
