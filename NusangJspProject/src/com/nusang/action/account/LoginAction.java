package com.nusang.action.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.bo.KakaoBO;
import com.nusang.bo.NaverBO;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward actionForward = null;
		User user = null;
		switch (ConAsist.getRequestName(request)) {
		case "kakaologin":
			user = kakaoLogin(request);
			break;
		case "naverlogin":
			user = naverLogin(request);
			break;
		}

		User entity = UserDao.getInstance().findBy("username", user.getUsername());

		if (entity == null) {
			System.out.println("회원가입을 아직 하지 않아서 자동 회원가입진행");
			UserDao.getInstance().insertUser(user);
		} else {
			System.out.println("우리 회원이시군요!");
		}

		System.out.println("로그인 처리");
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		return actionForward;
	}

	private User kakaoLogin(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {

		// 토큰 발급받을 수 있는 코드
		String code = request.getParameter("code");
		KakaoBO.getInstance().reqAuthToken(code);
		return KakaoBO.getInstance().reqUserInfo();
	}

	private User naverLogin(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {

		String code = request.getParameter("code");
		String state = request.getParameter("state");
		System.out.println("naverCode : " + code);
		NaverBO.getInstance().reqAuthToken(code, state);
		return NaverBO.getInstance().reqUserInfo();

	}

}
