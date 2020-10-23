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
//import com.nusang.action.myinfo.PaymentList_Action;
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
					actionForward = new ActionForward();
					actionForward.setNextPath(ConAsist.URL_MYINFOMAIN);
					//
					break;
					
				case "paymentList":
//					PaymentList_Action P_A = new PaymentList_Action();
//					actionForward = P_A.execute(request, response);
					break;
				case "reservationInfo":
					break;
				case "buyInfo":
					break;
				case "watchList":
					actionForward = new ActionForward();
					break;
				case "위치설정":
					actionForward = new ActionForward();
					break;
				case "saleList":
					actionForward = new ActionForward();
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
