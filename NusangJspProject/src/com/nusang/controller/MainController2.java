package com.nusang.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.main.Index_Action;
import com.nusang.controller.assistance.ConAsist;

@WebServlet("/main2/*")
public class MainController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Action action = null;
		ActionForward actionForward = null;
		String requestPage = ConAsist.getRequestName(request);

		try {
			switch (requestPage) {
			case "index":
				action = new Index_Action();
				actionForward = action.execute(request, response);
				break;
			case "chk":
				actionForward = new ActionForward();
				actionForward.setNextPath(ConAsist.URL_CHKLOCATION);
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
