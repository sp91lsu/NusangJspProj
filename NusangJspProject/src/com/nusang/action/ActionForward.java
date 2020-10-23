package com.nusang.action;

public class ActionForward {
	private boolean isRedirect;
	private String nextPath;

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	public String getNextPath() {
		System.out.println(nextPath);
		return nextPath;
	}

	public void setNextPath(String nextPath) {
		this.nextPath = nextPath;
	}

}
