package com.nusang.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Post_Picture {

	private int post_picno;
	private String p_1;
	private String p_2;
	private String p_3;
	private String p_4;
	private String p_5;

	public void setPicture(List<String> list) {
		int num = list.size();

		if (num > 0) {
			p_1 = list.get(0);
		}
		if (num > 1) {
			p_2 = list.get(1);
		}
		if (num > 2) {
			p_3 = list.get(2);
		}
		if (num > 3) {
			p_4 = list.get(3);
		}
		if (num > 4) {
			p_5 = list.get(4);
		}
	}

	public ArrayList<String> getList() {
		ArrayList<String> list = new ArrayList<String>();
		list.add(p_1);
		list.add(p_2);
		list.add(p_3);
		list.add(p_4);
		list.add(p_5);
		return list;
	}
}
