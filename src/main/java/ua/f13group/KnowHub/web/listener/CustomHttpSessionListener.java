package ua.f13group.KnowHub.web.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import ua.f13group.KnowHub.service.PropertyService;

public class CustomHttpSessionListener implements HttpSessionListener {
	
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
		event.getSession().setMaxInactiveInterval(maxInactiveInterval);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {		
	}
}