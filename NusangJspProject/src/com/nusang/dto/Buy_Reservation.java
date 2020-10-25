package com.nusang.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
public class Buy_Reservation {
	private int sellpostno;
	private int userno;
	private long reser_price;
	private String state;
	private int reserno;
	private Date regdate;
}
