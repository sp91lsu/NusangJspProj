package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.Payment_MarketDao;
import com.nusang.dao.PostDao;
import com.nusang.dto.Payment_Market;
import com.nusang.dto.Post;
import com.nusang.dto.User;

public class CreatePost_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Post post = new Post();
		request.setCharacterEncoding("UTF-8");

		String pm_merchant_uid = request.getParameter("pm_merchant_uid");
		String pm_paid_amount = request.getParameter("pm_paid_amount");
		String imp_uid = request.getParameter("pm_imp_uid");

		User user = (User)request.getSession().getAttribute("user");
		
		Payment_Market pm = Payment_Market.builder().name("게시글 등록 " + pm_paid_amount)
				.imp_uid(imp_uid)
				.paymenttype("card")
				.state("결제")
				.userno(user.getUserno()).build();
		
		Payment_MarketDao.getInstance().insert(pm);
		
		
		post.setTitle(request.getParameter("title"));
		post.setCategory(request.getParameter("category"));
		post.setPrice(Long.parseLong(request.getParameter("price")));
		post.setBodytext(request.getParameter("bodytext"));
		int insertResult = PostDao.getInstance().insertPost(post);
		request.setAttribute("result", insertResult);
		ActionForward acf = new ActionForward();
		acf.setNextPath("/4_post/createOk.jsp");
		return acf;
	}

}
