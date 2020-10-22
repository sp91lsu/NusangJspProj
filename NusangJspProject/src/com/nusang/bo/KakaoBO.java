package com.nusang.bo;

import java.util.HashMap;
import java.util.Map;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.nusang.action.assistance.EContentType;
import com.nusang.action.assistance.KakaoAuthToken;
import com.nusang.action.assistance.MyHttpGet;
import com.nusang.action.assistance.MyHttpPost;
import com.nusang.data.NData;
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
	public void reqAuthToken(String... arr) {
		// 토큰 발급받을 수 있는 코드

		this.code = arr[0];
		MyHttpPost httpPost = new MyHttpPost(reqTokenURL, EContentType.FORM);
		System.out.println("code : " + code);
		System.out.println("Client_ID : " + Client_ID);
		ObjectNode createTokenNode = m.createObjectNode();
		createTokenNode.put("grant_type", "authorization_code");
		createTokenNode.put("client_id", Client_ID);
		createTokenNode.put("redirect_uri", redirectURL);
		createTokenNode.put("code", code);
		httpPost.setBody(createTokenNode);

		JsonNode resObject = httpPost.request();

		try {
			oAuthToken = m.readValue(resObject.toString(), KakaoAuthToken.class);
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

		Map<String,String> reqUserInfoMap = new HashMap<String, String>();
		reqUserInfoMap.put("Authorization", "Bearer " + oAuthToken.getAccess_token());
		httpGet.setHeader(reqUserInfoMap);

		JsonNode resNode = httpGet.request();

		System.out.println("사용자 정보 : " + resNode.toPrettyString());
		String id = resNode.get("id").asText();
		System.out.println(id);
		JsonNode accountNode = resNode.get("kakao_account");
		String email = accountNode.get("email").asText();
		System.out.println("email : " + email);
		JsonNode profileNode = accountNode.get("profile");

		String userId = "kakao_" + id;
		String name = profileNode.get("nickname").asText();
		User user = User.builder().userid(userId).email(email).username(name).password(NData.security).logintype("KAKAO").location("fd").build();
		return user;
	}

}
