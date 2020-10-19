package com.nusang.action.account;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.assistance.EContentType;
import com.nusang.action.assistance.MyHttpPost;
import com.nusang.action.assistance.NaverAuthToken;
import com.nusang.bo.KakaoBO;
import com.nusang.bo.NaverBO;
import com.nusang.action.assistance.KakaoAuthToken;
import com.nusang.action.assistance.MyHttpGet;
import com.nusang.controller.assistance.ConAsist;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward actionForward = null;

		switch (ConAsist.getRequestName(request)) {
		case "kakaologin":
			kakaoLogin(request);
			break;
		case "naverlogin":
			naverLogin(request);
			break;
		}

		return actionForward;
	}

	private void kakaoLogin(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {

		// 토큰 발급받을 수 있는 코드
		String code = request.getParameter("code");
		System.out.println(code);
		KakaoBO.getInstance().reqAuthToken(code);
		KakaoBO.getInstance().reqUserInfo();

	}

	private void naverLogin(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {

		String code = request.getParameter("code");
		String state = request.getParameter("state");
		System.out.println("naverCode : " + code);

		NaverBO.getInstance().reqAuthToken(code, state);
		NaverBO.getInstance().reqUserInfo();

	}

}
