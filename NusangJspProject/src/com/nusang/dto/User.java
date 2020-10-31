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
	private String nickname;
	@Builder.Default
	private int view_distance = 5;
	private Date regdate;
	private String picture;
	private Location location;
	private ArrayList<Payment_Market> payment_MarketList;// 결제내역
	private ArrayList<Payment_User> payment_UserList;// 구매내역,판매내역
	private ArrayList<Buy_Reservation> reservationList;// 구매신청현황

	public boolean isLocationNull() {

		if (location != null) {
			if (location.getLongtitude() != 0 && location.getLatitude() != 0) {
				return false;
			}
		}
		return true;
	}

	public ArrayList<Payment_User> getSellList() {
		return findStateList(2);
	}

	public ArrayList<Payment_User> getBuyList() {
		return findStateList(1);
	}

	public ArrayList<Payment_User> findStateList(int state) {
		ArrayList<Payment_User> list = new ArrayList<Payment_User>();
		for (Payment_User payment_User : payment_UserList) {
			if (payment_User.getSellstate() == state) {
				list.add(payment_User);
			}
		}
		return list;
	}

	public Buy_Reservation getReservation(int postno) {
		for (Buy_Reservation br : reservationList) {
			if (br.getPost().getPostno() == postno) {
				return br;
			}
		}
		return null;
	}
}
