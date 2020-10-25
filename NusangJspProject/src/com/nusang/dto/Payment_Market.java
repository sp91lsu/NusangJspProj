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
public class Payment_Market {
	private Integer ph_marketno;
	private String paymenttype;
	private String state;
	private String name;
	private Integer userno;
	private Date regdate;
	private String imp_uid;
}
