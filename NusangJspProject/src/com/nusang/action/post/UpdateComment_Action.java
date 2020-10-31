package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.ReplyDao;
import com.nusang.dto.Post;
import com.nusang.dto.User;

public class UpdateComment_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int replyno = Integer.parseInt(request.getParameter("replyno"));
		String uptext = request.getParameter("updateText");

		int result = ReplyDao.getInstance().updateBy(replyno, "textbody", uptext);
		ActionForward actionForward = new ActionForward();
		actionForward.setAsyncData("" + result);
		return actionForward;
	}

}
