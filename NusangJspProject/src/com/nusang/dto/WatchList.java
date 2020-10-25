package com.nusang.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
public class WatchList {
	private int userno;
	private int watchlistno;
	private int postno;
}
