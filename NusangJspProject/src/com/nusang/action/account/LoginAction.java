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

		MyHttpPost httpPost = new MyHttpPost("https://kauth.kakao.com/oauth/token", EContentType.FORM);

		JSONObject postJson = new JSONObject();
		postJson.put("grant_type", "authorization_code");
		postJson.put("client_id", "7ac03576a3ef2b30b8b6545b6b0daf1c");
		postJson.put("redirect_uri", "http://localhost:8787/user/kakaologin");
		postJson.put("code", code);
		httpPost.setBody(postJson);

		JSONObject resObject = httpPost.request();

		ObjectMapper om = new ObjectMapper();
		KakaoAuthToken oAuthToken = om.readValue(resObject.toJSONString(), KakaoAuthToken.class);
		System.out.println("mapper accessToken : " + oAuthToken.getAccess_token());
		// 토큰 받기 완료

		// 사용자 정보 요청 token은 헤더에 담아서 보내야함
		MyHttpGet httpGet = new MyHttpGet("https://kapi.kakao.com/v2/user/me", EContentType.FORM);

		JSONObject getJson = new JSONObject();
		getJson.put("Authorization", "Bearer " + oAuthToken.getAccess_token());
		httpGet.setHeader(getJson);

		resObject = httpGet.request();

		System.out.println("사용자 정보 : " + resObject.toJSONString());
	}

	private void naverLogin(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {

		String code = request.getParameter("code");
		String state = request.getParameter("state");
		System.out.println("naverCode : " + code);

		MyHttpPost httpPost = new MyHttpPost("https://nid.naver.com/oauth2.0/token", EContentType.FORM);

		JSONObject postJson = new JSONObject();
		postJson.put("grant_type", "authorization_code");
		postJson.put("client_id", "h3YOPfhFkTcn5ls8RX3g");
		postJson.put("client_secret", "csg5mhfpih");
		postJson.put("code", code);
		postJson.put("state", state);
		httpPost.setBody(postJson);

		JSONObject resObject = httpPost.request();

		ObjectMapper om = new ObjectMapper();
		NaverAuthToken oAuthToken = om.readValue(resObject.toJSONString(), NaverAuthToken.class);
		System.out.println("mapper accessToken : " + oAuthToken.getAccess_token());

		// 토큰 받기 완료

		// 사용자 정보 요청 token은 헤더에 담아서 보내야함
		MyHttpGet httpGet = new MyHttpGet("https://openapi.naver.com/v1/nid/me", EContentType.FORM);

		JSONObject getJson = new JSONObject();
		getJson.put("Authorization", "Bearer " + oAuthToken.getAccess_token());
		httpGet.setHeader(getJson);

		resObject = httpGet.request();

		System.out.println("사용자 정보 : " + resObject.toJSONString());

	}

}
