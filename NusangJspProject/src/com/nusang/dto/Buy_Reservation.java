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
public class Buy_Reservation {
	private Post post;// 게시글
	private User user;// 구매신청한 유저
	private long reser_price;// 구매금액
	private String state;// 진행 상태  구매신청, 구매등록 list 1 구매등록 else 구매신청
	private int reserno;// 테이블 고유값
	private Date regdate;// 날짜
}
