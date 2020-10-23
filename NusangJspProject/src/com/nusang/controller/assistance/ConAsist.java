package com.nusang.controller.assistance;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

//controller를 도와주는 클래스
public class ConAsist {

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
}
