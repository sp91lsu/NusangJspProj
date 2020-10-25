package com.nusang.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
public class Payment_User {
	private int ph_userno;
	private String productname;
	private long price;
	private int business_partner;
	private String sellstate;
	private Date regdate;
	private int userno;


}
