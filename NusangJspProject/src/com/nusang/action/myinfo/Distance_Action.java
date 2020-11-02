package com.nusang.action.myinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.EActionType;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

public class Distance_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		int dis1km =Integer.parseInt(request.getParameter("num"));
		System.out.println("반경 설정 세상으로 이동,, 파라미터num:"+dis1km);
		User user = (User)request.getSession().getAttribute("user");
		UserDao.getInstance().updateBy(user.getUserno(), "view_distance", dis1km);
		ConAsist.updateMyUser(request);
		System.out.println(dis1km + "----------------------------------------------------");
		actionForward.setNextPath(ConAsist.URL_CHKLOCATION);
		return actionForward;
	}

}
