package com.nusang.dto;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Post {

	private int postno;
	/* private byte[] picture; */
	private String title;
	private String bodytext;
	private long price;
	private String productname;
	private User user;
	private String regdate;
	private String category;
	private int sellstate;
	private int viewcnt;
	private int visible;
	private Location location;
	private Post_Picture post_picture;
	private ArrayList<Reply> replyList;
	private ArrayList<Buy_Reservation> reservationList;// 구매신청현황
	private ArrayList<WatchList> watchList;

	public User getReserUser() {
		return getCurReservation().getUser();
	}

	public Buy_Reservation getCurReservation() {
		for (Buy_Reservation br : reservationList) {
			if (br.getState() == 1) {
				return br;
			}
		}
		return null;
	}

	public String getStateStr() {

		switch (sellstate) {
		case 0:
			return "판매중";
		case 1:
			return "구매 예약중";
		case 2:
			return "판매 완료";
		}
		return "";
	}

}
