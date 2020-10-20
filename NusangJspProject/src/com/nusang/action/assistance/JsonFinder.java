package com.nusang.action.assistance;

import java.util.Map;

import org.json.simple.JSONObject;

public class JsonFinder {

	JSONObject jo;
	Map<String, Object> child;

	public JsonFinder(JSONObject jo) {
		this.jo = jo;
	}

	public Object findGet(String key) {
		child = (Map<String, Object>) child.get(key);
		return child;
	}

	public String getString(String key) {
		return (String) child.get(key);
	}

	public Map<String, Object> getFirst(String key) {
		child = (Map<String, Object>) jo.get(key);
		return child;
	}
}
