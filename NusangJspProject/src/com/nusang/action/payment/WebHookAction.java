package com.nusang.action.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.Payment_MarketDao;
import com.nusang.dto.Payment_Market;
import com.nusang.dto.User;

public class WebHookAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JsonNode webHookNode = ConAsist.getJSON(request);
		
		// 결제관리
		String status = webHookNode.get("status").asText();
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
		
		return null;
	}
	
//	결제가 승인되었을 때(모든 결제 수단) - (status : paid)
//	가상계좌가 발급되었을 때 - (status : ready)
//	가상계좌에 결제 금액이 입금되었을 때 - (status : paid)
//	예약결제가 시도되었을 때 - (status : paid or failed)
//	대시보드에서 환불되었을 때 - (status : cancelled)

}
