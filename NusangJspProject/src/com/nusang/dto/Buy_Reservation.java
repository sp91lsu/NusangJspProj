package com.nusang.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Buy_Reservation {
	private Post sellpost;
	private User user;
	private long reser_price;
	private String state;
	private int reserno;
	private Date regdate;
}
