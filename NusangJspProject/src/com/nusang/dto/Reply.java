package com.nusang.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private int replyno;
	private User user;
	private int postno;
	private String textbody;
	private Date regdate;
	private int state;
	private Integer child_replyno;

}
