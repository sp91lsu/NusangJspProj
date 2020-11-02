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

		ActionForward actionForward = new ActionForward();
		actionForward.setNextPath(ConAsist.URL_MAIN);
		
		request.setCharacterEncoding("UTF-8");
		Map params = request.getParameterMap();
		
		//검색어 정리 
		String searchWord = request.getParameter("searchWord");
		
		
		//카테고리 정리 (DB 쿼리문에 들어갈 String 형태로)
		String[] arr_categorys = request.getParameterValues("category");
		String categorys = "(";
		for (String ct : arr_categorys) {
			categorys += "'" + ct + "',";
		}
		categorys = categorys.substring(0, categorys.length()-1);
		categorys += ")";
		
		//정렬
		String order = request.getParameter("order");
		int price_min = Integer.parseInt( request.getParameter("price_min") );
		int price_max = Integer.parseInt( request.getParameter("price_max") );
		int view_distance = Integer.parseInt( request.getParameter("view_distance") );
		
		
		
		Location location = ConAsist.getLocation(request);
		User user = (User) request.getSession().getAttribute("user");
		UserDao.getInstance().updateBy(user.getUserno(), "view_distance", view_distance);

		// 근방의 게시글 가지고 오기
		List<Post> postList = PostDao.getInstance().findPostByDetailSearch(categorys,order,view_distance,location);
		System.out.println("이 근처 " + view_distance + "km의 게시글 갯수 : "+ postList.size());
		request.setAttribute("postList", postList);

		return actionForward;
	}

}
