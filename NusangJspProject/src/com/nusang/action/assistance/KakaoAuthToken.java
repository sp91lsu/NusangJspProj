package com.nusang.action.assistance;

import lombok.Data;

@Data
public class KakaoAuthToken {

	String access_token;
	String token_type;
	String refresh_token;
	int expires_in;
	String scope;
	int refresh_token_expires_in;
}
