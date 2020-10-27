package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.bo.KakaoBO;
import com.nusang.dao.Payment_MarketDao;
import com.nusang.dao.PostDao;
import com.nusang.dto.Location;
import com.nusang.dto.Payment_Market;
import com.nusang.dto.Post;
import com.nusang.dto.User;

public class CreatePost_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Post post = new Post();
		request.setCharacterEncoding("UTF-8");

		String pm_merchant_uid = request.getParameter("pm_merchant_uid");
		int pm_paid_amount = Integer.parseInt(request.getParameter("pm_paid_amount"));
		String imp_uid = request.getParameter("pm_imp_uid");

		User user = (User) request.getSession().getAttribute("user");

		double map_latitude = Double.parseDouble(request.getParameter("map_latitude"));
		double map_longtitude = Double.parseDouble(request.getParameter("map_longtitude"));

		Payment_Market pm = Payment_Market.builder().name("게시글 등록 ").imp_uid(imp_uid).paymenttype("card").state("결제")
				.userno(user.getUserno()).price(pm_paid_amount).build();

		Payment_MarketDao.getInstance().insert(pm);

		Location location = KakaoBO.getInstance().reqLocation(map_longtitude, map_latitude);
		location.setTabletype("POST");
		post.setTitle(request.getParameter("title"));
		post.setCategory(request.getParameter("category"));
		post.setPrice(Integer.parseInt(request.getParameter("price")));
		post.setBodytext(request.getParameter("bodytext"));
		post.setProductname(request.getParameter("productName"));
		post.setUser(user);
		post.setLocation(location);
		int insertResult = PostDao.getInstance().insertPost(post);
		request.setAttribute("result", insertResult);
		ActionForward acf = new ActionForward();
		acf.setNextPath("/4_post/createOk.jsp");
		return acf;
	}

}
