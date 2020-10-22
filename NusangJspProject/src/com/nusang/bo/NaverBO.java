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
import com.nusang.action.assistance.NaverAuthToken;
import com.nusang.data.NData;
import com.nusang.dto.User;

public class NaverBO extends BasicBO {

	private static NaverBO instance;

	public static NaverBO getInstance() {
		if (instance == null) {
			instance = new NaverBO();
		}
		return instance;
	}

	private NaverBO() {
		Client_ID = "h3YOPfhFkTcn5ls8RX3g";
		reqTokenURL = "https://nid.naver.com/oauth2.0/token";
		redirectURL = "http://localhost:8787/user/kakaologin";
		reqUserInfoURL = "https://openapi.naver.com/v1/nid/me";
	}

	private String client_secret = "csg5mhfpih";
	private NaverAuthToken oAuthToken = null;
	private String state = null;

	@Override
	public void reqAuthToken(String... authArr) {
		// 토큰 발급받을 수 있는 코드
		this.code = authArr[0];
		this.state = authArr[1];
		MyHttpPost httpPost = new MyHttpPost(reqTokenURL, EContentType.FORM);

		ObjectNode createTokenNode = m.createObjectNode();
		createTokenNode.put("grant_type", "authorization_code");
		createTokenNode.put("client_id", Client_ID);
		createTokenNode.put("client_secret", client_secret);
		createTokenNode.put("code", code);
		createTokenNode.put("state", state);
		httpPost.setBody(createTokenNode);

		JsonNode resObject = httpPost.request();

		try {
			System.out.println(resObject.toPrettyString());
			oAuthToken = m.readValue(resObject.toString(), NaverAuthToken.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("mapper accessToken : " + oAuthToken.getAccess_token());

		// 토큰 받기 완료

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
		JsonNode userMap = resNode.get("response");

		String userId = userMap.get("email") + "_" + userMap.get("id");
		String name = userMap.get("name").asText();
		User user = User.builder().email(userMap.get("email").asText()).userid(userId).username(name).password(NData.security).logintype("NAVER").build();
		return user;
	}

}
