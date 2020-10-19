package com.nusang.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class User {

	private int uuid;
	private String userid;
	private String username;
	private String password;
	private String role;
}
