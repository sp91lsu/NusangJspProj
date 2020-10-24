package com.nusang.dto;

import com.nusang.data.Location;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class User {

	private int userno;
	private String userid;
	private String username;
	private String password;
	private String role;
	private String logintype;
	private String email;
	private String regdate;
	private byte[] picture;
	private double latitude;
	private double longtitude;

	public boolean isLocationNull() {
		return longtitude == 0 && longtitude == 0;
	}
}
