package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.ReplyDao;
import com.nusang.dto.Reply;
import com.nusang.dto.User;

public class AddComments_Aciton implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		int state = Integer.parseInt(request.getParameter("secretmode"));

		Reply reply = Reply.builder().postno(Integer.parseInt(request.getParameter("postno")))
				.textbody(request.getParameter("replyText")).state(state)
				.user((User) request.getSession().getAttribute("user")).child_replyno(null).build();
		ReplyDao.getInstance().insert(reply);
		Integer replyno = (int) reply.getReplyno();

		ActionForward actionForward = new ActionForward();
		actionForward.setAsyncData(replyno.toString());

		System.out.println("댓글 등록 " + "state:" + state + " postno:" + request.getParameter("postno") + " 내용 : " + request.getParameter("replyText"));
		return actionForward;
	}
}