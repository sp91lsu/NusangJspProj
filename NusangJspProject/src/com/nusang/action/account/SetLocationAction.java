package com.nusang.action.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.EActionType;
import com.nusang.bo.KakaoBO;
import com.nusang.bo.Mail;
import com.nusang.bo.NaverBO;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.UserDao;
import com.nusang.data.Location;
import com.nusang.dto.User;

public class SetLocationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// new Mail().sendMail();
		User user = (User)request.getSession().getAttribute("user");
		ActionForward actionForward = new ActionForward();

		if(user != null)
		{
			
			String searchValue = request.getParameter("searchValue");
			KakaoBO.getInstance().reqLocationList(searchValue);
			//UserDao.getInstance().updateBy(user.getUserno(), colum, value)(user)
		}
		
		actionForward.setActionType(EActionType.REDIRECT);
		actionForward.setNextPath(ConAsist.URL_MAIN);
		return actionForward;
	}
}
