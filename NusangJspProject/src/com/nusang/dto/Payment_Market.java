package com.nusang.dto;


import java.util.Date;

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
	private String paymenttype;// 카카오,네이버,카드
	private int state;// 결제 환불
	private String name;// 판매 or 등록
	private Integer userno;
	private Date regdate;// 날짜
	private String imp_uid;// 등록 아이디. 제일 앞에 띄우기
	private long price;
	private Post post;
}
