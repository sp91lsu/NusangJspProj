package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.BasicDao;
import com.nusang.dao.ReplyDao;

public class DeleteComment_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		int replyno = Integer.parseInt(request.getParameter("replyno"));
		ReplyDao.getInstance().deleteBy(replyno);

		actionForward.setAsyncData("" + replyno);
		System.out.println(replyno + "번 댓글 삭제");
		return actionForward;
	}

}
