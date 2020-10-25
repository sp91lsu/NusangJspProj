package com.nusang.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
public class Payment_Market {
	private int ph_marketno;
	private String patmenttype;
	private int state;
	private String name;
	private int userno;
	private Date regdate;
	private String import_uuid;
}
