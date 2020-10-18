package com.nusang.controller.asist;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.json.simple.JSONObject;

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
	public static JSONObject getJSON(HttpServletRequest request) throws IOException {

		JSONParser parser = new JSONParser(request.getInputStream());

		JSONObject jsonObject = new JSONObject();
		try {
			jsonObject.putAll(parser.object());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("getJSON : " + jsonObject.toString());

		return jsonObject;
	}
}
