package com.nusang.action.myinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.EActionType;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

public class Nickname_change_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		actionForward.setNextPath(ConAsist.URL_PROFILE);
		System.out.println("보낸 닉네임값 : " + request.getParameter("nickName"));
		User user = (User) request.getSession().getAttribute("user"); //유저 가져옴
		UserDao.getInstance().updateBy(user.getUserno(), "username", request.getParameter("nickName")); 
										//유저 고유값 가져옴    ,  바꿀 컬럼 명 ,    바꿀 컬럼 값
		user = UserDao.getInstance().findBy("userno", user.getUserno());
		System.out.println(user.getUsername());
		actionForward.setActionType(EActionType.REDIRECT);

		request.getSession().setAttribute("user", user);
		return actionForward;
	}

}
