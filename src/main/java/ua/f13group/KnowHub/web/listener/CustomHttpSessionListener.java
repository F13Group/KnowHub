package ua.f13group.KnowHub.web.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import ua.f13group.KnowHub.service.PropertyService;

public class CustomHttpSessionListener implements HttpSessionListener {
	
	private static final Logger logger = Logger.getLogger(CustomHttpSessionListener.class);
	
	private static final int DEFAULT_SESSION_TIMEOUT = 15*60;
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		
		ApplicationContext ctx = 
				WebApplicationContextUtils.
				getWebApplicationContext(session.getServletContext());

		PropertyService propertyService = 
				(PropertyService) ctx.getBean("propertyService");
		
		String res = propertyService.getProperty("session_timeout");
		int maxInactiveInterval = DEFAULT_SESSION_TIMEOUT;
		
		if (res != null && !res.isEmpty()) {
			maxInactiveInterval = Integer.parseInt(res);
		}
		session.setMaxInactiveInterval(maxInactiveInterval);
		logger.info("Session created with timeout: " + maxInactiveInterval);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		logger.info("Session destroyed");
	}

}
