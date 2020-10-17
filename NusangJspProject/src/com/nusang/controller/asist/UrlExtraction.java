package com.nusang.controller.asist;

import javax.servlet.http.HttpServletRequest;

public class UrlExtraction {

	public static String getRequestString(HttpServletRequest request) {
		String requestURI = request.getRequestURI();
		int lstindex = requestURI.lastIndexOf("/") + 1;
		String requestName = requestURI.substring(lstindex);
		System.out.println(requestName);
		return requestName;
	}
}
