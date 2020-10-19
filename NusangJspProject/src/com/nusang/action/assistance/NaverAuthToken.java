package com.nusang.action.assistance;

import lombok.Data;

@Data
public class NaverAuthToken {
	String access_token;
	String refresh_token;
	String token_type;
	int expires_in;
	String error;
	String error_description;
}
