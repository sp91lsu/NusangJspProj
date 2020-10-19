package com.nusang.bo;

import org.json.simple.JSONObject;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nusang.action.assistance.EContentType;
import com.nusang.action.assistance.KakaoAuthToken;
import com.nusang.action.assistance.MyHttpGet;
import com.nusang.action.assistance.MyHttpPost;
import com.nusang.dto.User;

public class KakaoBO extends BasicBO {

	private static KakaoBO instance;

	public static KakaoBO getInstance() {
		if (instance == null) {
			instance = new KakaoBO();
		}
		return instance;
	}

	private KakaoBO() {
		Client_ID = "7ac03576a3ef2b30b8b6545b6b0daf1c";
		reqTokenURL = "https://kauth.kakao.com/oauth/token";
		redirectURL = "http://localhost:8787/user/kakaologin";
		reqUserInfoURL = "https://kapi.kakao.com/v2/user/me";
	}

	private KakaoAuthToken oAuthToken = null;

	@Override
	public void reqAuthToken(String... code) {
		// 토큰 발급받을 수 있는 코드
		this.code = code[0];
		MyHttpPost httpPost = new MyHttpPost(reqTokenURL, EContentType.FORM);

		JSONObject postJson = new JSONObject();
		postJson.put("grant_type", "authorization_code");
		postJson.put("client_id", Client_ID);
		postJson.put("redirect_uri", redirectURL);
		postJson.put("code", code);
		httpPost.setBody(postJson);

		JSONObject resObject = httpPost.request();

		ObjectMapper om = new ObjectMapper();

		try {
			oAuthToken = om.readValue(resObject.toJSONString(), KakaoAuthToken.class);
			System.out.println("mapper accessToken : " + oAuthToken.getAccess_token());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public User reqUserInfo() {
		// 사용자 정보 요청 token은 헤더에 담아서 보내야함
		MyHttpGet httpGet = new MyHttpGet(reqUserInfoURL, EContentType.FORM);

		JSONObject getJson = new JSONObject();
		getJson.put("Authorization", "Bearer " + oAuthToken.getAccess_token());
		httpGet.setHeader(getJson);

		JSONObject resObject = httpGet.request();

		System.out.println("사용자 정보 : " + resObject.toJSONString());
		return null;
	}

}
