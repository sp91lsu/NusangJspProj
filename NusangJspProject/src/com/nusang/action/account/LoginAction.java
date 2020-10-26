package com.nusang.action.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.nusang.action.Action;
import com.nusang.action.ActionForward;
import com.nusang.action.EActionType;
import com.nusang.bo.KakaoBO;
import com.nusang.bo.Mail;
import com.nusang.bo.NaverBO;
import com.nusang.controller.assistance.ConAsist;
import com.nusang.dao.LocationDao;
import com.nusang.dao.UserDao;
import com.nusang.dto.Location;
import com.nusang.dto.User;

import sqlmap.SqlSessionManager;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// new Mail().sendMail();
		HttpSession session = request.getSession();
		ActionForward actionForward = new ActionForward();
		User user = null;
		switch (ConAsist.getRequestName(request)) {
		case "kakaologin":
			user = kakaoLogin(request);
			user = sosialLogin(session, user);
			break;
		case "naverlogin":
			user = naverLogin(request);
			user = sosialLogin(session, user);
			break;
		case "login":
			user = login(request);
			break;
		}

		if (user != null) {

			System.out.println("로그인 처리");
			System.out.println("actionForward " + actionForward);
			session.setAttribute("user", user);
			actionForward.setActionType(EActionType.REDIRECT);
			actionForward.setNextPath("/1_main/index.jsp");
		} else {
			System.out.println("여기로빠졌다");
			request.setAttribute("error", "아이디 혹은 패스워드가 다릅니다. 다시 시도해주세요.");
			actionForward.setNextPath("/0_common/error.jsp");
		}

		return actionForward;
	}

	private User kakaoLogin(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {

		// 토큰 발급받을 수 있는 코드
		String code = request.getParameter("code");
		KakaoBO.getInstance().reqAuthToken(code);
		return KakaoBO.getInstance().reqUserInfo();
	}

	private User naverLogin(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {

		String code = request.getParameter("code");
		String state = request.getParameter("state");
		System.out.println("naverCode : " + code);
		NaverBO.getInstance().reqAuthToken(code, state);
		return NaverBO.getInstance().reqUserInfo();

	}

	private User login(HttpServletRequest request) throws JsonMappingException, JsonProcessingException {

		String userid = request.getParameter("userid");
		String password = request.getParameter("password");

		User user = UserDao.getInstance().loginCheck(userid, password);

		return user;
	}

	private User sosialLogin(HttpSession session, User user) {

		user.setRole("ROLE_USER");
		User entity = UserDao.getInstance().findBy("userid", user.getUserid());

		if (entity == null) {
			System.out.println("회원가입을 아직 하지 않아서 자동 회원가입진행");
			UserDao.getInstance().insertUser(user);
		} else {
			System.out.println("우리 회원이시군요");
			user = entity;
			if (entity.getLocation() == null) {
				Location location = (Location) session.getAttribute("location");
				UserDao.getInstance().updateLocation(entity.getUserno(), location);
				System.out.println("insertLocation");
			}
		}
		return user;
	}

}
