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
import com.nusang.action.assistance.JHttpClient;
import com.nusang.action.assistance.KakaoAuthToken;
import com.nusang.controller.assistance.ConAsist;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward actionForward = null;

		switch (ConAsist.getRequestName(request)) {
		case "kakaologin":
			kakaoLogin(request);
			break;
		}

		return actionForward;
	}

	private void kakaoLogin(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {
		
		//토큰 발급받을 수 있는 코드
		String code = request.getParameter("code");
		System.out.println(code);

		JHttpClient client = new JHttpClient("https://kauth.kakao.com/oauth/token", EContentType.FORM);

		JSONObject bodyObject = new JSONObject();
		bodyObject.put("grant_type", "authorization_code");
		bodyObject.put("client_id", "7ac03576a3ef2b30b8b6545b6b0daf1c");
		bodyObject.put("redirect_uri", "http://localhost:8787/user/kakaologin");
		bodyObject.put("code", code);
		client.setBody(bodyObject);

		JSONObject resObject = client.request();

		ObjectMapper om = new ObjectMapper();
		System.out.println();
		KakaoAuthToken oAuthToken = om.readValue(resObject.toJSONString(), KakaoAuthToken.class);
		System.out.println("mapper accessToken : " + oAuthToken.getAccess_token());
		//토큰 받기 완료 
		
	}

}
