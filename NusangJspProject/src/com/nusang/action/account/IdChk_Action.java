package com.nusang.action.account;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

public class IdChk_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		String uid = request.getParameter("uid");
		String idPattern = "^[A-Za-z]{1}[A-Za-z0-9]{5,19}$"; // 첫글자는 영어 6글자 이상
		User userid = UserDao.getInstance().findBy("userid", uid);

		boolean chk = Pattern.matches(idPattern, uid);

		if ((uid == "")) {
			actionForward.setAsyncData("0");
		} else if ((userid == null) && (uid != "") && chk == true) {
			actionForward.setAsyncData("1");
		} else if (chk == false) {
			actionForward.setAsyncData("2");
		} else {
			actionForward.setAsyncData("3");
		}
		return actionForward;

	}

}
