package com.nusang.dto;

import lombok.Data;

@Data
public class User {

	private int uuid;
	private String userid;
	private String username;
	private String password;
	private String role;
}
