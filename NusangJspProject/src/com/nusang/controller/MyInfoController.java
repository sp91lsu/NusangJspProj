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
import com.nusang.action.myinfo.BuyInfo_Action;
import com.nusang.action.myinfo.NicknameChange_Action;
import com.nusang.action.myinfo.PaymentList_Action;
import com.nusang.action.myinfo.ReservationInfo_Action;
import com.nusang.action.myinfo.SaleList_Action;
import com.nusang.action.myinfo.Search_Action;
import com.nusang.action.myinfo.WatchList_Action;
//import com.nusang.action.myinfo.PaymentList_Action;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

@WebServlet("/myinfo/*")
public class MyInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Action action = null;
		ActionForward actionForward = new ActionForward();
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
					PaymentList_Action P_A = new PaymentList_Action();
					actionForward = P_A.execute(request, response);
					break;
				case "reservationInfo":
					ReservationInfo_Action R_A = new ReservationInfo_Action();
					actionForward = R_A.execute(request, response);
					break;
				case "buyInfo":
					BuyInfo_Action B_A = new BuyInfo_Action();
					actionForward = B_A.execute(request, response);
					break;
				case "watchList":
					WatchList_Action W_A = new WatchList_Action();
					actionForward = W_A.execute(request, response);
					break;
				case "search":
					Search_Action S_A = new Search_Action();
					actionForward = S_A.execute(request, response);
					break;
				case "saleList":
					SaleList_Action SL_A = new SaleList_Action();
					actionForward = SL_A.execute(request, response);
					break;
				case "nickname_change":
					NicknameChange_Action N_A = new NicknameChange_Action();
					actionForward = N_A.execute(request, response);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		actionForward.moveUrl(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
