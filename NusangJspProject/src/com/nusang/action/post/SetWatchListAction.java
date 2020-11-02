package com.nusang.action.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.Buy_ReservationDao;
import com.nusang.dao.PostDao;
import com.nusang.dao.WatchListDao;
import com.nusang.dto.Post;
import com.nusang.dto.User;
import com.nusang.dto.WatchList;

public class SetWatchListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		User user = ConAsist.getSessionUser(request);
		int postno = Integer.parseInt(request.getParameter("postno"));
		Post post = PostDao.getInstance().findByNo(postno);

		// dto post.java와 table SELLPOST 에 heartcnt +1
		int newheartcnt = post.getHeartcnt() + 1;
		post.setHeartcnt(newheartcnt);
		PostDao.getInstance().updateBy(postno, "heartcnt", newheartcnt);

		WatchList wl = WatchList.builder().post(post).userno(user.getUserno()).build();
		int result = WatchListDao.getInstance().insert(wl);

		ActionForward af = new ActionForward();

		ObjectMapper m = new ObjectMapper();
		ObjectNode objNode = m.createObjectNode();
		
		objNode.put("result", result);
		objNode.put("newheartcnt", newheartcnt);
		af.setAsyncData(objNode.toString());
		return af;

	}

}
