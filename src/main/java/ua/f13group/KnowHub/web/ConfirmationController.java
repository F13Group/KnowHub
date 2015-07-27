package ua.f13group.KnowHub.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ua.f13group.KnowHub.service.UserService;

@Controller
public class ConfirmationController implements MessageSourceAware {
	
	private MessageSource messageSource;
	
	@Override
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;		
	}
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/confirmation/{userlink}",method = RequestMethod.GET)
	public ModelAndView confirm(@PathVariable String userlink, ModelAndView model){
		if(userService.confirmUser(userlink) != null){
		
			model.addObject("notificationMessage",
					messageSource.getMessage("info.notificationpage.registrationConfirmed",
							null, null));
			model.setViewName("notification");
			return model;
		}else{
			model.addObject("notificationMessage",
					messageSource.getMessage("info.notificationpage.confirmationError",
							null, null));
			model.setViewName("notification");
			return model;	
		}
			
	}
}
