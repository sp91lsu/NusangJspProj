package com.nusang.controller.assistance;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nusang.action.ActionForward;
import com.nusang.action.EActionType;
import com.nusang.bo.KakaoBO;
import com.nusang.dao.PostDao;
import com.nusang.dao.UserDao;
import com.nusang.dto.Location;
import com.nusang.dto.Post;
import com.nusang.dto.User;

//controller를 도와주는 클래스
public class ConAsist {
	public static final String SERVLET_MAIN = "/main/index";
	public static final String SERVLET_READPOST = "/post/readPost";
	public static final String SERVLET_UPDATEPOST = "/post/updatePost";
	public static final String SERVLET_DELETEPOST = "/post/deletePost";
	public static final String SERVLET_MYINFODISTANCE = "/myinfo/distance";
	public static final String SERVLET_REFUND = "/payment/refund";

	public static final String URL_CHKLOCATION = "/1_main/index.jsp";
	public static final String URL_MAIN = "/1_main/main.jsp";
	public static final String URL_MAIN2 = "/1_main/postListAjax.jsp";
	public static final String URL_LOGIN = "/3_account/login.jsp";
	public static final String URL_MYINFOMAIN = "/4_myInfo/myInfoMain.jsp";
	public static final String URL_SEARCH = "/5_search_location/search.jsp";
	public static final String URL_MKPOST = "/4_post/createPost.jsp";
	public static final String URL_UPDATEPOST = "/4_post/updatePost.jsp";
	public static final String URL_PROFILE = "/4_myInfo/myInfoMain.jsp";
	public static final String URL_ERROR = "/0_common/error.jsp";

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
			actionForward.setActionType(EActionType.REDIRECT);
		}
		return actionForward;
	}

	public static Location getLocation(HttpServletRequest request) throws Exception {
		Double longtitude = 0.0;
		Double latitude = 0.0;
		request.setCharacterEncoding("utf-8");
		Location location = (Location) request.getSession().getAttribute("location");
		User user = (User) request.getSession().getAttribute("user");
		if (user != null && !user.isLocationNull()) {
			System.out.println("userLocation ");
			location = user.getLocation();
		} else if (location == null) {
			System.out.println("sessionLocation");
			System.out.println("-------------------"+request.getParameter("longitude"));
			longtitude = Double.parseDouble(request.getParameter("longitude"));
			latitude = Double.parseDouble(request.getParameter("latitude"));
			location = KakaoBO.getInstance().reqLocation(longtitude, latitude);
		}

		request.getSession().setAttribute("location", location);
		return location;
	}

	public static User getSessionUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute("user");
	}

	public static User updateMyUser(HttpServletRequest request) {
		User user = UserDao.getInstance().findBy("userno", getSessionUser(request).getUserno());
		request.getSession().setAttribute("user", user);
		return user;
	}

	public static ActionForward isMyPost(HttpServletRequest request) {

		int postno = Integer.parseInt(request.getParameter("postno"));
		Post post = PostDao.getInstance().findByNo(postno);
		User user = getSessionUser(request);
		ActionForward actionForward = null;

		if (post.getUser().getUserno() != user.getUserno()) {
			actionForward = new ActionForward();
			actionForward.setNextPath(URL_ERROR);
			request.setAttribute("error", "잘못된 접근입니다.");
		}
		return actionForward;
	}

}
