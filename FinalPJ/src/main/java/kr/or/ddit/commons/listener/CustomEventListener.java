package kr.or.ddit.commons.listener;

import javax.servlet.ServletContext;

import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
public class CustomEventListener {
	
	private ServletContext application;
	
	
	@EventListener(ContextRefreshedEvent.class)
	public void contextEventListener(ContextRefreshedEvent event) {
		if(application==null) {
			WebApplicationContext container = (WebApplicationContext) event.getApplicationContext();
			application = container.getServletContext();
			application.setAttribute("cPath", application.getContextPath());
		}
	}
}















