package com.nusang.action.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.PostDao;
import com.nusang.dao.UserDao;
import com.nusang.dto.Location;
import com.nusang.dto.Post;
import com.nusang.dto.User;

public class SearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("서치액션 도착!!!");
		ActionForward actionForward = new ActionForward();
		actionForward.setNextPath(ConAsist.URL_MAIN2);
		
		request.setCharacterEncoding("UTF-8");
		
		//검색어 정리 
		String handedSearchWord = request.getParameter("searchWord");
		request.setAttribute("searchWord", handedSearchWord);
		
	    handedSearchWord = handedSearchWord.trim();
	    String searchWord = "'"+handedSearchWord;
	    searchWord = searchWord.replaceAll("( )+", "|");
	    searchWord += "'";
		
		//카테고리 정리 (DB 쿼리문에 들어갈 String 형태로)
		String[] arr_categories = request.getParameterValues("category");
		request.setAttribute("categories",arr_categories);
		String categories = "(";
		for (String ct : arr_categories) {
			categories += "'" + ct + "',";
		}
		categories = categories.substring(0, categories.length()-1);
		categories += ")";
		
		//정렬
		String order = request.getParameter("order");
		request.setAttribute("order", order);
		//가격
		String min = request.getParameter("price_min");
		String max = request.getParameter("price_max");
		request.setAttribute("price_min", min);
		request.setAttribute("price_max", max);
		int price_min = min == "" ? 0 : Integer.parseInt( min );
		int price_max = max == "" ? 0 : Integer.parseInt( max );
		//동네범위
		int view_distance = Integer.parseInt( request.getParameter("view_distance") );
		request.setAttribute("view_distance", view_distance);
		
		
		Location location = ConAsist.getLocation(request);

		// 근방의 게시글 가지고 오기
		List<Post> postList = null;
		if(handedSearchWord.equals("")) {
			postList = PostDao.getInstance().findPost_searchWordNull(categories,order,price_min,price_max,view_distance,location);
		}else{
			postList = PostDao.getInstance().findPostByDetailSearch(searchWord,categories,order,price_min,price_max,view_distance,location);
		}
		System.out.println("이 근처 " + view_distance + "km의 게시글 갯수 : "+ postList.size());
		request.setAttribute("postList", postList);

		return actionForward;
	}

}
