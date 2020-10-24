package com.nusang.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User {

	private int userno;
	private String userid;
	private String username;
	private String password;
	private String role;
	private String logintype;
	private String email;
	private Date regdate;
	private byte[] picture;
	private Location location;

	public boolean isLocationNull() {

		if (location != null) {
			if (location.getLongtitude() != 0 && location.getLatitude() != 0) {
				return false;
			}
		}
		return true;
	}
}
