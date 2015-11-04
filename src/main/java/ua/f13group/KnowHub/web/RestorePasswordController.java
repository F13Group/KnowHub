package ua.f13group.KnowHub.web;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ua.f13group.KnowHub.domain.User;

/*
 * Date of creation 11.04.2015
 * @author Dmytro Derzhevytskyi
 */

@Controller
public class RestorePasswordController {

	private static final Logger logger = Logger.getLogger(RestorePasswordController.class);
	
	@RequestMapping("/restore")
	public ModelAndView restorePassword(ModelAndView modelAndView, @RequestParam(value = "error", required = false) String error){
		logger.info("inside restorePassword method");
		
		if (error != null) {
			logger.info("if error - " + error);
			modelAndView.addObject("error", "Sorry but this link has been already expired. Please go back to <a href='/knowhub/login'>Forgot your password?</a> to get new link.");
		}
		
		logger.info("after if block");
		modelAndView.addObject("newUser", new User());
		modelAndView.setViewName("restorePassword");
		return modelAndView;
	}
	
}
