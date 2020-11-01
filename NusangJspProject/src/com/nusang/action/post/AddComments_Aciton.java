package com.nusang.action.post;

import java.util.HashMap;
import java.util.Map;

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

		int state = request.getParameter("secretmode").equals("on") ? 0 : 1;
		System.out.println("댓글 등록");
		System.out.println("replyText : " + request.getParameter("replyText"));
		System.out.println(request.getParameter("postno"));
		System.out.println("secretmode" + request.getParameter("secretmode"));

		Reply reply = Reply.builder().postno(Integer.parseInt(request.getParameter("postno")))
				.textbody(request.getParameter("replyText")).state(state)
				.user((User) request.getSession().getAttribute("user")).child_replyno(null).build();
		/*
		 * Map<String, Object> map = new HashMap<String, Object>(); map.put("postno",
		 * )); map.put("textbody", ); map.put("state", state); map.put("userno",
		 * userno); map.put("state", 1); map.put("child_replyno", null);
		 */
		ReplyDao.getInstance().insert(reply);
		Integer replyno = (int) reply.getReplyno();

		ActionForward actionForward = new ActionForward();
		actionForward.setAsyncData(replyno.toString());

		return actionForward;
	}
}