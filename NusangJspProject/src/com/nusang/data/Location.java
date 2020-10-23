package com.nusang.data;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Location {

	private float latitude;
	private float longtitude;
	private String region_1;
	private String region_2;
	private String region_3;

	public String getAddress() {
		return getRegion_1() + " " + getRegion_2() + " " + getRegion_3();
	}
}
