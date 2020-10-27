package com.nusang.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.assistance.EContentType;
import com.nusang.action.assistance.MyHttpPost;
import com.nusang.action.payment.RefundAction;
import com.nusang.action.payment.WebHookAction;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.Payment_MarketDao;
import com.nusang.dto.Payment_Market;

@WebServlet("/payment/*")
public class ImportController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImportController() {
		super();
		// TODO Auto-generated constructor stub
	}

	// imp_uid는 아임포트 주문번호, merchant_uid는 가맹점 주문번호, 그리고 status는 결제 결과

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ActionForward actionForward = null;
		Action action = null;
		ObjectMapper m = new ObjectMapper();
		JsonNode resNode = null;

		try {
			switch (ConAsist.getRequestName(request)) {
			case "webhook":

				action = new WebHookAction();
				action.execute(request, response);
				return;

			// 환불
			case "refund":
				action = new RefundAction();

				actionForward = action.execute(request, response);

				break;

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (actionForward != null) {
			actionForward.moveUrl(request, response);
		} else {
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(resNode.toString());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
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
