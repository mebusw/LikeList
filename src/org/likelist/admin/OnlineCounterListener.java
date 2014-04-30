package org.likelist.admin;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.apache.log4j.Logger;

public class OnlineCounterListener implements HttpSessionListener {
	Logger logger = Logger.getLogger(OnlineCounterListener.class);

	public void sessionCreated(HttpSessionEvent hse) {
		logger.info("session create " + (String) hse.getSession().getId() + ":"
				+ OnlineCounter.getOnline());
		OnlineCounter.raise();
	}

	public void sessionDestroyed(HttpSessionEvent hse) {
		logger.info("session destroy " + hse.getSession().getId() + ":"
				+ (String) hse.getSession().getAttribute("username") + ":"
				+ OnlineCounter.getOnline());
		OnlineCounter.reduce();
	}
}