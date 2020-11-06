package com.nusang.action.myinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.Payment_UserDao;
import com.nusang.dto.Payment_User;

public class MyInfoEvaluationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();

		Integer ph_userno = Integer.parseInt( request.getParameter("ph_userno"));
		float star_cnt = Float.parseFloat(request.getParameter("star_cnt"));
		
		Payment_User pu = Payment_UserDao.getInstance().findByNo(ph_userno);
		Integer result = 0;
		if(pu != null)
		{
			result = Payment_UserDao.getInstance().updateEvaluation(ph_userno,star_cnt); 
		}
		
		actionForward.setAsyncData(result.toString());
		
		return actionForward;
	}

}
