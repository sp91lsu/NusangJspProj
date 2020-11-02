package com.nusang.action.post;

import java.sql.Date;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.util.concurrent.TimeUnit;

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
import com.nusang.dto.User;

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

		User user = ConAsist.getSessionUser(request);

		int postNo = Integer.parseInt(request.getParameter("postno"));
		java.util.Date date = new Date(System.currentTimeMillis());
		DateFormat format1 = DateFormat.getDateInstance(DateFormat.FULL);

		Post post = PostDao.getInstance().findByNo(postNo);

		long time = System.currentTimeMillis() - post.getRegdate().getTime();
		System.out.println("뺀 값은?? :" + time);
		long minutes = TimeUnit.MILLISECONDS.toMinutes(time);
		System.out.println("현재시간 : " + System.currentTimeMillis());
		System.out.println(format1.format(date));
		System.out.println("구매시간 : " + post.getRegdate().getTime());
		System.out.println(format1.format(post.getRegdate().getTime()));
		ActionForward acf = new ActionForward();
		System.out.println("시간차 : " + minutes);
		if (minutes < 10) {
			System.out.println("환불 ㄱㄱ ");
			Payment_Market pm = user.findPMByPost(post.getPostno());
			request.setAttribute("payment_market", pm);
			acf.setNextPath(ConAsist.SERVLET_REFUND);

		} else {
			PostDao.getInstance().deleteBy(postNo);
			acf.setNextPath(ConAsist.SERVLET_MAIN);
		}

		// Payment_MarketDao.getInstance().findBy("imp_uid", )

		return acf;
	}

}
