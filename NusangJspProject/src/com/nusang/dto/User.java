package com.nusang.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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
	private String picture;
	private Location location;
	private ArrayList<Payment_Market> payment_MarketList;
	private ArrayList<Payment_User> payment_UserList;
	private ArrayList<Buy_Reservation> buy_ReservationList;
	
	public boolean isLocationNull() {

		if (location != null) {
			if (location.getLongtitude() != 0 && location.getLatitude() != 0) {
				return false;
			}
		}
		return true;
	}
}
