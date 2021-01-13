package com.nusang.ajax;

import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nusang.dto.Post;

public class responseJSON {
	
	/*
	 * Jackson-databind 사용하여 JSON response
	 */
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		List<Post> dtoList = (List<Post>) request.getAttribute("list");
		System.out.println("dtoList.size: "+dtoList.size());
		AjaxPostListJSON json = new AjaxPostListJSON();  // response 할 Java 객체
		if(dtoList == null) {
			json.setStatus("FAIL");
		} else {
			json.setStatus("OK");
			json.setCount(dtoList.size());
			json.setList(dtoList);
		}
		
		ObjectMapper mapper = new ObjectMapper();   // Java -> Json 매핑할 Mapper 객체
		
//		String jsonString1 = mapper.writeValueAsString(json);
//		PostList postList = mapper.readValue(jsonString1, PostList.class);
		try {
			String jsonString = mapper.writeValueAsString(json);
			
			System.out.println("responseJSON에서 jsonString: "+jsonString);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);  // response 내보내기 
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

} // end Command




















