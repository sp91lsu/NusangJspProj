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
	private User business_partner;//거래자
	private int sellstate;//거래상태: 1 구매 or 2 판매
	private Date regdate;//날짜
	private int userno;//유저 고유값
}
