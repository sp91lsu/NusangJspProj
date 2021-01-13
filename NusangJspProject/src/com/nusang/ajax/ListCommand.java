package com.nusang.ajax;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.PostDao;
import com.nusang.dto.Location;
import com.nusang.dto.Post;
import com.nusang.dto.User;

public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("리스트커맨드 도착!!!");
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		User user = (User) request.getSession().getAttribute("user");
		List<Post> postList = null;
		Location location=null;
		try {
			location = ConAsist.getLocation(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//로그아웃 상태 & 초기로딩(or새로고침)
		String isStart = request.getParameter("isStart");
		if(user == null && "true".equals(isStart)) {
			postList = PostDao.getInstance().findPostNearBy10km(location);
			request.setAttribute("list", postList);
			System.out.println("로그아웃 초기로딩 세팅");
    		return;
		}
		
		//검색어 정리 
		String handedSearchWord = request.getParameter("searchWord");
		System.out.println(handedSearchWord);
	    handedSearchWord = handedSearchWord.trim();
	    String searchWord = "'"+handedSearchWord;
	    searchWord = searchWord.replaceAll("( )+", "|");
	    searchWord += "'";
			
    	//로그아웃 상태 & 키워드 있음
    	if(user == null) {
			postList = PostDao.getInstance().findPostByKeyword(searchWord, location);
    		request.setAttribute("list", postList);
    		return;
    	}
	    	
	    	
		//카테고리 정리 (DB 쿼리문에 들어갈 String 형태로)
		String[] arr_categories = request.getParameterValues("category");
		System.out.println(Arrays.toString(arr_categories));
		String categories = "(";
		for (String ct : arr_categories) {
			categories += "'" + ct + "',";
		}
		categories = categories.substring(0, categories.length()-1);
		categories += ")";
		
		//정렬
		String order = request.getParameter("order");

		
		//가격
		String min = request.getParameter("price_min");
		String max = request.getParameter("price_max");
		int price_min = min == "" ? 0 : Integer.parseInt( min );
		int price_max = max == "" ? 0 : Integer.parseInt( max );
		
		//동네범위
		int view_distance = Integer.parseInt( request.getParameter("view_distance") );
		
		
		

		// 근방의 게시글 가지고 오기
		if(handedSearchWord.equals("")) {
			//로그인 상태 & 키워드 없음
			postList = PostDao.getInstance().findPost_searchWordNull(categories,order,price_min,price_max,view_distance,location);
		}else{
			//로그인 상태 & 키워드 있음
			postList = PostDao.getInstance().findPostByDetailSearch(searchWord,categories,order,price_min,price_max,view_distance,location);
		}
		System.out.println("postList길이: "+postList.size());
		System.out.println("이 근처 " + view_distance + "km의 게시글 갯수 : "+ postList.size());
		request.setAttribute("list", postList);
		
	}

}
