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
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		
		ApplicationContext ctx = 
				WebApplicationContextUtils.
				getWebApplicationContext(session.getServletContext());

		PropertyService propertyService = 
				(PropertyService) ctx.getBean("propertyService");

		propertyService.toString();
		int maxInactiveInterval = Integer.parseInt(propertyService.getProperty("session_timeout"));
		//int maxInactiveInterval = 15*60;
		event.getSession().setMaxInactiveInterval(maxInactiveInterval);
		logger.info("Session created with timeout: " + maxInactiveInterval);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		// TODO Auto-generated method stub
		logger.info("Session destroyed");
	}

}
