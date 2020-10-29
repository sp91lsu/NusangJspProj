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
		ActionForward actionForward = new ActionForward();
		actionForward.setAsyncData("");
		
		Reply reply = new Reply();
		User user = (User) request.getSession().getAttribute("user");
		int userno = user.getUserno();
		
		reply.setPostno(Integer.parseInt(request.getParameter("postno")));
		reply.setTextbody(request.getParameter("replyText"));
		reply.setUserno(userno);
		ReplyDao.getInstance().insert(reply);
		return actionForward;
	}
}