package com.nusang.action.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward actionForward = new ActionForward();

		actionForward.setNextPath(ConAsist.URL_MAIN);

		return actionForward;
	}

}
