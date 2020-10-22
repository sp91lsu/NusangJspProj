package com.nusang.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.assistance.EContentType;
import com.nusang.action.assistance.MyHttpPost;
import com.nusang.action.assistance.JsonFinder;
import com.nusang.controller.assistance.ConAsist;

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

		ActionForward actionForward = null;
		JSONObject jsonObjet = null;
		JSONObject res = null;
		Action action = null;

		switch (ConAsist.getRequestName(request)) {
		case "webhook":
			jsonObjet = ConAsist.getJSON(request);

			// 결제관리
			paymentProcess(jsonObjet.get("status").toString());

			break;

		// 환불
		case "refund":

//			"merchant_uid" : "mid_mermer", // 주문번호
//			"cancel_request_amount" : 100, // 환불금액
//			"reason" : "테스트 결제 환불", // 환불사유
			jsonObjet = ConAsist.getJSON(request);
			// {"imp_uid":"imp_670663832422","merchant_uid":"mid_123","status":"paid"}
			////////////////////////////////////////////// 토큰발행
			System.out.println();
			System.out.println();
			System.out.println();
			System.out.println("토큰 발행 ");

			JSONObject tokenBody = new JSONObject();
			tokenBody.put("imp_key", "0642725073895705");
			tokenBody.put("imp_secret",
					"Qg0L7Sv9zZnhgYl2id0SY4s9dM460CdRTdC167aG6yYnwkpPxpHvuaEHWINXl1Offqgmxr2EZ11wlqlS");

			MyHttpPost client = new MyHttpPost("https://api.iamport.kr/users/getToken", EContentType.JSON);

			client.setBody(tokenBody);
			res = client.request();

			////////////////////////////////////////////// 토큰발행

			////////////////////////////////// 토큰 가지고 아임포트에 환불요청
			System.out.println();
			System.out.println();
			System.out.println();
			System.out.println("환불요청");
			JSONObject header2 = new JSONObject();

			JsonFinder jf = new JsonFinder(res);
			String accessToken = (String) jf.getFirst("response").get("access_token");

			System.out.println("resString = " + accessToken);

			header2.put("Authorization", "Bearer " + accessToken);
			client = new MyHttpPost("https://api.iamport.kr/payments/cancel", EContentType.JSON);

			client.setHeader(header2);
			client.setBody(jsonObjet);
			res = client.request();

			////////////////////////////////// 토큰 가지고 아임포트에 환불요청
			break;

		}

		if (actionForward != null) {
			if (actionForward.isRedirect()) {
				response.sendRedirect(actionForward.getNextPath());
			} else {
				request.getRequestDispatcher(actionForward.getNextPath()).forward(request, response);
			}
		} else {
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(res);
		}
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

//환불을 위한 엑세스토큰 발급받기 
//url: "https://api.iamport.kr/users/getToken",
//method: "post", // POST method
//headers: { "Content-Type": "application/json" }, // "Content-Type": "application/json"
//data: {
//  imp_key: "imp_apikey", // REST API키
//  imp_secret: "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f" // REST API Secret
//}
