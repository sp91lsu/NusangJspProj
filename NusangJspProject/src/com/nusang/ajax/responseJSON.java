package com.nusang.ajax;

import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nusang.dto.Post;

public class responseJSON {
	
	/*
	 * Jackson-databind 사용하여 JSON response
	 */
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		List<Post> dtoList = (List<Post>) request.getAttribute("list");
		
		AjaxPostListJSON list = new AjaxPostListJSON();  // response 할 Java 객체
		
		if(dtoList == null) {
			list.setStatus("FAIL");
		} else {
			list.setStatus("OK");
			list.setCount(dtoList.size());
			list.setList(dtoList);
		}
		
		ObjectMapper mapper = new ObjectMapper();   // Java -> Json 매핑할 Mapper 객체
		
		try {
			String jsonString = mapper.writeValueAsString(list);
			
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);  // response 내보내기 
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

} // end Command




















