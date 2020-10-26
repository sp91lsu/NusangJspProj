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
	private byte[] picture;
	private String title;
	private String bodytext;
	private long price;
	private String productname;
	private int userno;
	private String regdate;
	private String category;
	private String sellstate;
	private int viewcnt;
	private int visible;
	private Location location;
	private ArrayList<Buy_Reservation> buy_ReservationList;
	
}
