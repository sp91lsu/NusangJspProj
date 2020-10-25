package com.nusang.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
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
	
}
