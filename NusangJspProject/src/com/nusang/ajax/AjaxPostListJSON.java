package com.nusang.ajax;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.nusang.dto.Post;

@JsonInclude(Include.NON_NULL)
public class AjaxPostListJSON {
	int count;  // 데이터 개수
	String status;  // 처리 결과
	
	@JsonIgnore
	String memo;  // JSON 변환시 제외할 데이터  
	
	@JsonProperty("pList")  // Json property 이름(브라우저 콘솔에서 확인가능)과 Java 클래스 이름이 다른 경우
	List<Post> list;   // 글 목록 데이터 

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public List<Post> getList() {
		return list;
	}

	public void setList(List<Post> list) {
		this.list = list;
	}
	
	
	
	
}
