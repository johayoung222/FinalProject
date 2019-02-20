package com.kh.spring.common.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionCounterListener implements HttpSessionListener {
	
	public static int userInflow = 0;

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		userInflow++;
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub

	}

}
