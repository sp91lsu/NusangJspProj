package com.nusang.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.json.JSONParser;
import org.json.simple.JSONObject;

import com.nusang.controller.asist.ConAsist;

/**
 * Servlet implementation class PaymentController
 */
@WebServlet("/payment/*")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PaymentController() {
		super();
		// TODO Auto-generated constructor stub
	}



	// imp_uid는 아임포트 주문번호, merchant_uid는 가맹점 주문번호, 그리고 status는 결제 결과

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("payment callback");

		switch (ConAsist.getRequestName(request)) {
		case "webhook":
			JSONObject jsonObjet = ConAsist.getJSON(request);
			
			//결제관리
			paymentProcess(jsonObjet.get("status").toString());

			break;

		}

		System.out.println(request.getParameter("json"));
		String requstName = ConAsist.getRequestName(request);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
//	결제가 승인되었을 때(모든 결제 수단) - (status : paid)
//	가상계좌가 발급되었을 때 - (status : ready)
//	가상계좌에 결제 금액이 입금되었을 때 - (status : paid)
//	예약결제가 시도되었을 때 - (status : paid or failed)
//	대시보드에서 환불되었을 때 - (status : cancelled)
	private void paymentProcess(String status) {
		switch (status) {
		case "paid":
			System.out.println("결제완료");
			break;
		case "ready":
			System.out.println("가상계좌 발급");
			break;
		case "failed":
			System.out.println("실패");
			break;
		case "cancelled":
			System.out.println("환불처리");
			break;

		}
	}

}
