package com.nusang.controller.assistance;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nusang.action.ActionForward;
import com.nusang.dto.User;

//controller를 도와주는 클래스
public class ConAsist {

	public static final String URL_MAIN = "/1_main/index.jsp";
	public static final String URL_LOGIN = "/3_account/login.jsp";
	public static final String URL_MYINFOMAIN = "/4_myInfo/myInfoMain.jsp";

	// 요청 마지막 경로
	public static String getRequestName(HttpServletRequest request) {
		String requestURI = request.getRequestURI();
		int lstindex = requestURI.lastIndexOf("/") + 1;
		String requestName = requestURI.substring(lstindex);
		System.out.println(requestName);
		return requestName;
	}

	// json으로 보낸 데이터 읽기
	public static JsonNode getJSON(HttpServletRequest request) throws IOException {

		ObjectMapper mapper = new ObjectMapper();
		JsonParser parser = mapper.createParser(request.getInputStream());
		JsonNode node = mapper.readTree(parser);

		System.out.println("getJSON : " + node.toPrettyString());

		return node;
	}

	public static ActionForward checkLogin(HttpServletRequest request) {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ActionForward actionForward = null;
		if (user == null) {
			actionForward = new ActionForward();
			actionForward.setNextPath(URL_LOGIN);
			actionForward.setRedirect(true);
		}
		return actionForward;
	}
}
