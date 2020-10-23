package com.nusang.action.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

public class UserSelectAll implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		
		List<User> userList = UserDao.getInstance().selectAll();

		System.out.println("list : " + userList.get(0).getUserid());
		
		ActionForward af = new ActionForward();
		request.setAttribute("userlist",userList );
		
		af.setNextPath("list.jsp");
		
		return af;
	}

}
