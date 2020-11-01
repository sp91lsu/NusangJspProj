package com.nusang.action.post;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.Buy_ReservationDao;
import com.nusang.dao.PostDao;
import com.nusang.dto.Post;

public class ReadPost_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int postNo = Integer.parseInt(request.getParameter("postno"));
		Post post = PostDao.getInstance().findBy("postno", postNo);

		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;

		if (cookies != null && cookies.length > 0) {

			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("VIEWCOOKIE")) { // Cookie의 name이 VIEWCOOKIE와 일치하는 쿠키를 viewCookie에 넣어준다.
					viewCookie = cookies[i];
				}
			}
		}

		// 만일 viewCookie없다면
		if (viewCookie == null) {
			System.out.println("VIEWCOOKIE 없음");
			Cookie newCookie = new Cookie("VIEWCOOKIE", "|" + postNo + "|");
			response.addCookie(newCookie);
		} else {
			System.out.println("VIEWCOOKIE 있음");
			String value = viewCookie.getValue();
			int viewCnt = post.getViewcnt() + 1;
			int result = PostDao.getInstance().updateBy(post.getPostno(), "viewcnt", viewCnt);

			if (result > 0 && value.indexOf("|" + postNo + "|") < 0) { // 입력한 번화와 일치하는 번호가 없으면 추가한다.
				value = value + "|" + postNo + "|";
				viewCookie.setValue(value);
				viewCookie.setMaxAge(60 * 60 * 12);
				response.addCookie(viewCookie);
				post.setViewcnt(viewCnt);
			}
		}

		request.setAttribute("post", post);
		ActionForward acf = new ActionForward();
		acf.setNextPath("/4_post/readPost.jsp");
		return acf;
	}

}
