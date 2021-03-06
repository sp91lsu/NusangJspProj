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
	private float star_cnt;
	private int evaluation_cnt;
	private String nickname;
	@Builder.Default
//	기본검색반경
	private int view_distance = 10;
	private Date regdate;
	private String picture;
	private Location location;
	private ArrayList<Payment_Market> payment_MarketList;// 결제내역
	private ArrayList<Payment_User> payment_UserList;// 구매내역,판매내역
	private ArrayList<Buy_Reservation> reservationList;// 구매신청현황
	private ArrayList<WatchList> watchList;

	public boolean isLocationNull() {

		if (location != null) {
			if (location.getLongtitude() != 0 && location.getLatitude() != 0) {
				return false;
			}
		}
		return true;
	}

	public ArrayList<Payment_User> takeSellList() {
		return findStateList(2);
	}

	public ArrayList<Payment_User> takeBuyList() {
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

	public Buy_Reservation takeReservation(int postno) {
		for (Buy_Reservation br : reservationList) {
			if (br.getPost().getPostno() == postno) {
				return br;
			}
		}
		return null;
	}

	public WatchList findWatch(int postno) {
		for (WatchList watch : watchList) {
			if (postno == watch.getPost().getPostno()) {
				return watch;
			}
		}
		return null;
	}

	//게시글 번호를 통해서 결제 내역 찾기 
	public Payment_Market findPMByPost(int postno) {

		for (Payment_Market payment_Market : payment_MarketList) {
			Post post = payment_Market.getPost();

			if (post != null && post.getPostno() == postno) {
				return payment_Market;
			}
		}
		return null;
	}
}
