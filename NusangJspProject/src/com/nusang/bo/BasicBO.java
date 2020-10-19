package com.nusang.bo;

import org.json.simple.JSONObject;

import com.nusang.action.assistance.MyHttpGet;
import com.nusang.action.assistance.MyHttpPost;

import lombok.Data;

@Data
public abstract class BasicBO {
	MyHttpPost httpPost;
	MyHttpGet httpGet;
	String tokenURL = null;
	String Client_ID = null;
	String reqTokenURL = null;
	String redirectURL = null;
	String reqUserInfoURL = null;
	String code = null;

	public abstract void reqAuthToken(String... code);
	public abstract JSONObject reqUserInfo();
}
