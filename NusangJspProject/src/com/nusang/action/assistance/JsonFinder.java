package com.nusang.action.assistance;

import java.util.Map;

import org.json.simple.JSONObject;

public class JsonFinder {

	JSONObject jo;
	Map<String, Object> child;

	public JsonFinder(JSONObject jo) {
		this.jo = jo;
	}

	public Map<String, Object> get(String key) {
		child = (Map<String, Object>) child.get(key);
		return child;
	}

	public Map<String, Object> getFist(String key) {
		child = (Map<String, Object>) jo.get(key);
		return child;
	}
}
