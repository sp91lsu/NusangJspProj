package com.nusang.action.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.Document;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

public class IdChk_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		String uid = request.getParameter("uid");
		User userid = UserDao.getInstance().findBy("userid", uid);

		if ((uid == "")) {
			actionForward.setAsyncData("아이디를 입력해 주세요.");
		} else if ((userid == null) && (uid != "")) {
			actionForward.setAsyncData("사용가능한 아이디 입니다.");
		} else {
			actionForward.setAsyncData("중복된 아이디 입니다");
		}
		return actionForward;
	}

}