package com.nusang.bo;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.nusang.action.assistance.MyHttpGet;
import com.nusang.action.assistance.MyHttpPost;
import com.nusang.dto.User;

import lombok.Data;

//소셜 api사용을 위해 만듦
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
	protected ObjectMapper m = new ObjectMapper();
	public abstract void reqAuthToken(String... code);
	
}
