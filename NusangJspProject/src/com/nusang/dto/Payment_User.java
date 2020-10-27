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
public class Payment_User {
	private int ph_userno;//테이블 고유값
	private String productname;//상품명
	private long price;//가격
	private int business_partner;//거래자
	private String sellstate;//거래상태 : 구매 or 판매
	private Date regdate;//날자
	private int userno;//유저 고유값
}