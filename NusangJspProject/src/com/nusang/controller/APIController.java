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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nusang.action.ActionForward;
import com.nusang.bo.KakaoBO;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.data.Location;
import com.nusang.dto.User;

@WebServlet("/api/*")
public class APIController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		ActionForward actionForward = new ActionForward();
		String requestPage = ConAsist.getRequestName(request);

		try {
			switch (requestPage) {
			case "kakao_locale_api":

				double longtitude = 0;
				double latitude = 0;
				User user = (User) request.getSession().getAttribute("user");
				if (user != null && !user.isLocationNull()) {
					System.out.println("userLocation ");
					longtitude = user.getLongtitude();
					latitude = user.getLatitude();
				} else {
					System.out.println("sessionLocation");
					longtitude = Float.parseFloat(request.getParameter("longitude"));
					latitude = Float.parseFloat(request.getParameter("latitude"));
				}
				Location location = KakaoBO.getInstance().reqLocation(longtitude, latitude);
				request.getSession().setAttribute("location", location);
				String address = location.getAddress();
				actionForward.setAsyncData(address);
				break;

			case "search_location":

				String searchValue = KakaoBO.getInstance().reqLocationList(request.getParameter("searchValue"));
				actionForward.setAsyncData(searchValue);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		actionForward.moveUrl(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
