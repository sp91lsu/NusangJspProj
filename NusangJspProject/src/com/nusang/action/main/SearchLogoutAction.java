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

public class SearchLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("서치(로그아웃)액션 도착!!!");
		ActionForward actionForward = new ActionForward();
		actionForward.setNextPath(ConAsist.URL_MAIN);
		
		request.setCharacterEncoding("UTF-8");
		
		//검색어 정리 
		String searchWord0 = request.getParameter("searchWord");
		
	    searchWord0 = searchWord0.trim();
	    String searchWord = "'"+searchWord0;
	    searchWord = searchWord.replaceAll("( )+", "|");
	    searchWord += "'";
		
		Location location = ConAsist.getLocation(request);

		// 근방의 게시글 가지고 오기
		List<Post> postList = PostDao.getInstance().findPostByKeyword(searchWord, location);
		System.out.println("이 근처 " + 5 + "km의 게시글 갯수 : "+ postList.size());
		request.setAttribute("postList", postList);

		return actionForward;
	}

}
