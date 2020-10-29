package com.nusang.action.myinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.Buy_ReservationDao;
import com.nusang.dto.User;

public class ReservationInfo_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		actionForward.setNextPath("/4_myInfo/myInfoMain.jsp?sidemenu=reservationInfo.jsp");
		
		User user =  ConAsist.getSessionUser(request);
		
		
		return actionForward;
	}

}
