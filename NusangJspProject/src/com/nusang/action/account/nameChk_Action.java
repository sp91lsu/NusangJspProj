package com.nusang.action.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

public class nameChk_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		String uName = request.getParameter("uName");
		User serverName = UserDao.getInstance().findBy("username", uName);
		System.out.println("이 유저닉네임이 서버에 있니??" + serverName);
		if((uName == "")) {
			actionForward.setAsyncData("0");
		}else if((serverName == null) && (uName != null)){
			actionForward.setAsyncData("1");
		}else {
			actionForward.setAsyncData("2");
		}
		
		return actionForward;
	}

}
