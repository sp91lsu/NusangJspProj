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
public class Payment_User {
	private int ph_userno;
	private String productname;
	private long price;
	private User business_partner;
	private String sellstate;
	private Date regdate;
	private User user;


}
