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
		
		User user = (User) request.getSession().getAttribute("user");
		int userno = user.getUserno();

		System.out.println("댓글 등록");
		System.out.println("replyText : " + request.getParameter("replyText"));
		System.out.println(request.getParameter("postno"));
		System.out.println(userno);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postno", Integer.parseInt(request.getParameter("postno")));
		map.put("textbody", request.getParameter("replyText"));
		map.put("userno", userno);
		map.put("state", 1);
		map.put("child_replyno", null);
		ReplyDao.getInstance().insert(map);
		Integer replyno = (int) map.get("replyno");
		
		ActionForward actionForward = new ActionForward();
		actionForward.setAsyncData(replyno.toString());

		return actionForward;
	}
}