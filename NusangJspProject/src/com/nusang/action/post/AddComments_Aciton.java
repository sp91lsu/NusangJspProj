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
		actionForward.setAsyncData("들어오긴한다");
		
		Reply reply = new Reply();
		User user = (User) request.getSession().getAttribute("user");
		int userno = user.getUserno();
		
		reply.setPostno(Integer.parseInt(request.getParameter("postno")));
		reply.setTextbody(request.getParameter("replyComments"));
		reply.setUserno(userno);
		
		System.out.print("postno:" + request.getParameter("postno") +
						 " 내용:" + request.getParameter("replyText") + 
						 " 유저no:" + userno);
//		ReplyDao.getInstance().insert(reply);
		return actionForward;
	}

}
