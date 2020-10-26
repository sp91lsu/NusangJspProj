package com.nusang.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nusang.action.ActionForward;
import com.nusang.bo.KakaoBO;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dto.Location;
import com.nusang.dto.User;

@WebServlet("/api/*")
public class APIController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		ActionForward actionForward = new ActionForward();
		String requestPage = ConAsist.getRequestName(request);

		switch (requestPage) {
		case "kakao_locale_api":
			try {
				Location location = ConAsist.getLocation(request);
				String address = location.getAddress();
				// 여기서 바꿀 위치 이름 넣고 게시물 데이터요청 해야함
				actionForward.setAsyncData(address);
			} catch (Exception e) {
				actionForward.setAsyncData(e.getMessage());
				e.printStackTrace();
			}
			break;

		case "search_location":

			JsonNode searchValue = KakaoBO.getInstance().reqLocationList(request.getParameter("searchValue"));
			actionForward.setAsyncData(searchValue.toString());
			break;
		}

		actionForward.moveUrl(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
