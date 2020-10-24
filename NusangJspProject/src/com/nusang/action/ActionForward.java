package com.nusang.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.Data;

@Data
public class ActionForward {
	private String nextPath;
	private EActionType actionType = EActionType.FORWARD;
	private String asyncData;

	public String getNextPath() {
		System.out.println(nextPath);
		return nextPath;
	}

	public void setNextPath(String nextPath) {
		this.nextPath = nextPath;
	}

	public void setAsyncData(String asyncData) {
		this.asyncData = asyncData;
		actionType = EActionType.ASYNC;
	}

	public void moveUrl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		switch (getActionType()) {
		case FORWARD:
			request.getRequestDispatcher(getNextPath()).forward(request, response);
			break;

		case REDIRECT:
			response.sendRedirect(getNextPath());
			break;

		case ASYNC:
			response.getWriter().write(getAsyncData());
			break;
		}
	}
}
