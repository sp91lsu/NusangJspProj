package com.nusang.action.myinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;

public class PaymentList_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		actionForward.setNextPath("/4_myInfo/myInfoMain.jsp?sidemenu=paymentList.jsp");
		return actionForward;
	}

}
