package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.assistance.MyHttpPost;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.Buy_ReservationDao;
import com.nusang.dao.Payment_MarketDao;
import com.nusang.dao.PostDao;
import com.nusang.dto.Payment_Market;
import com.nusang.dto.Post;

public class DeletePost_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

//		jQuery.ajax({
//			"url" : "/payment/refund",
//			"type" : "POST",
//			"contentType" : "application/json",
//			"charset" : "utf-8",
//			"data" : JSON.stringify({
//				"merchant_uid" : "merchant_1602958478736", // 주문번호
//				"cancel_request_amount" : 100, // 환불금액
//				"reason" : "결제 환불", // 환불사유
				
			
		
		int postNo = Integer.parseInt(request.getParameter("postno"));
		
		Post post = PostDao.getInstance().findByNo(postNo);
		
		//Payment_MarketDao.getInstance().findBy("imp_uid", )
		
		
		
		PostDao.getInstance().deleteBy(postNo);
		ActionForward acf = new ActionForward();
		acf.setNextPath(ConAsist.SERVLET_MAIN);
		return acf;
	}

}
