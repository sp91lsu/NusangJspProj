package com.nusang.action.myinfo;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.EActionType;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.UserDao;
import com.nusang.dto.User;

public class NicknameChange_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward actionForward = new ActionForward();
		System.out.println("닉네임 체인지 세상으로 이동");
		actionForward.setNextPath(ConAsist.URL_PROFILE);
		String nickName = request.getParameter("nickName");
		System.out.println("보낸 닉네임값 : " + nickName);
		User user = (User) request.getSession().getAttribute("user"); //유저 가져옴
		
		User serverNickname = UserDao.getInstance().findBy("nickname", nickName);
		System.out.println("서버에 이 이름이 있어???  " + serverNickname);
		String namePattern = "^[가-힣]{2,7}$"; //한글만 2~7자
		boolean chk = Pattern.matches(namePattern, nickName);
		if((serverNickname == null) && (chk == true)) {
			
			UserDao.getInstance().updateBy(user.getUserno(), "nickname", nickName); 
			//유저 고유값 가져옴    ,  바꿀 컬럼 명 ,    바꿀 컬럼 값
			user = UserDao.getInstance().findBy("userno", user.getUserno());
			System.out.println("바뀐 닉네임 값 : " + user.getNickname());
			actionForward.setActionType(EActionType.REDIRECT);
			
			request.getSession().setAttribute("user", user);
			actionForward.setAsyncData("success");
		}else if((serverNickname == null) && (chk == false)){
			actionForward.setAsyncData("fail1");
		}else {
			System.out.println(user.getNickname());
			user.setNickname(user.getNickname());
			
			actionForward.setAsyncData("fail2");
		}
		return actionForward;
	}

}
