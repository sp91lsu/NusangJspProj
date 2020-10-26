package com.nusang.action.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dto.Location;
import com.nusang.dto.User;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward actionForward = null;
		
		
		User user = (User)request.getSession().getAttribute("user");
		
		//로그인 했으면 
		if(user != null)
		{
			Location location = user.getLocation();
		}else {
			
		}
		
		actionForward.setNextPath(ConAsist.URL_MAIN);
		
		return null;
	}

}
