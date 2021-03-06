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
public class Buy_Reservation {
	private Post post;// 게시글 /post/readPost?postno=
	private User user;// 구매신청한 유저
	private int reser_price;// 구매금액
	private int state;// 진행 상태  구매신청, 구매등록 list 1 구매등록 else 구매신청
	private int reserno;// 테이블 고유값
	private Date regdate;// 날짜
}
