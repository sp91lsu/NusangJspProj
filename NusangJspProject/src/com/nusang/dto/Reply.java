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
public class Reply {
	private int replyno;
	private int userno;
	private int postno;
	private String textbody;
	private Date regdate;
	private int state;
	private List<Reply> child_replyList;

}
