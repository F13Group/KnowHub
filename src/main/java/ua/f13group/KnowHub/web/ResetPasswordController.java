package ua.f13group.KnowHub.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ua.f13group.KnowHub.domain.User;

/*
 * Date of creation 11.04.2015
 * @author Dmytro Derzhevytskyi
 */

@Controller
public class ResetPasswordController extends AbstractSignUpController {

	private static final Logger logger = LoggerFactory.getLogger(ResetPasswordController.class);
	
	@RequestMapping(value = "/restore", method = RequestMethod.GET)
	public ModelAndView restorePassword(ModelAndView modelAndView, @RequestParam(value = "error", required = false) String error){
		logger.info("inside restorePassword method");
		
		if (error != null) {
			logger.info("if error - " + error);
			modelAndView.addObject("error", messageSource.getMessage("error.restorePage.linkExpired", null, null));
		}
		
		logger.info("after if block");
		modelAndView.addObject("newUser", new User());
		modelAndView.setViewName("resetPassword");
		return modelAndView;
	}
	
	@RequestMapping(value = "/restore", method = RequestMethod.POST)
	public ModelAndView changePassword(ModelAndView modelAndView){
		
		modelAndView.setViewName("resetPassword");
		return modelAndView; 
	}
	
}
