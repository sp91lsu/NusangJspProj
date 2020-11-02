package com.nusang.action.payment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.assistance.EContentType;
import com.nusang.action.assistance.MyHttpPost;
import com.nusang.controller.assistance.ConAsist;

public class RefundAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		"merchant_uid" : "mid_mermer", // 주문번호
//		"cancel_request_amount" : 100, // 환불금액
//		"reason" : "테스트 결제 환불", // 환불사유
		// {"imp_uid":"imp_670663832422","merchant_uid":"mid_123","status":"paid"}
		////////////////////////////////////////////// 토큰발행
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println("토큰 발행 ");
		ObjectMapper m = new ObjectMapper();
		ObjectNode tokenBody = m.createObjectNode();
		tokenBody.put("imp_key", "0642725073895705");
		tokenBody.put("imp_secret",
				"Qg0L7Sv9zZnhgYl2id0SY4s9dM460CdRTdC167aG6yYnwkpPxpHvuaEHWINXl1Offqgmxr2EZ11wlqlS");

		MyHttpPost client = new MyHttpPost("https://api.iamport.kr/users/getToken", EContentType.JSON);

		client.setBody(tokenBody);
		JsonNode resNode = client.request();

		////////////////////////////////////////////// 토큰발행

		////////////////////////////////// 토큰 가지고 아임포트에 환불요청
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println("환불요청");
		Map<String, String> header = new HashMap<String, String>();

		String accessToken =  resNode.get("response").get("access_token").asText();

		System.out.println("resString = " + accessToken);

		header.put("Authorization", "Bearer " + accessToken);
		client = new MyHttpPost("https://api.iamport.kr/payments/cancel", EContentType.JSON);
		client.setHeader(header);
		ObjectNode reqBodyNode = m.createObjectNode();
		reqBodyNode.put("reason", "10분 내 판매 게시글 삭제");
		reqBodyNode.put("imp_uid",  request.getParameter("imp_uid"));
		client.setBody(reqBodyNode);
		resNode = client.request();

		System.out.println(resNode.asText());
		////////////////////////////////// 토큰 가지고 아임포트에 환불요청
		return null;
	}

}
