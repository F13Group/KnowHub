package ua.f13group.KnowHub.web;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ua.f13group.KnowHub.domain.User;

/*
 * Date of creation 19.10.2015
 * @author Dmytro Derzhevytskyi
 */

@Controller
public class LoginController extends AbstractSignUpController {

	private static final Logger logger = Logger.getLogger(LoginController.class);

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView signup(ModelAndView model, 
			@RequestParam(value = "logout", required = false) String logout, 
			@RequestParam(value = "error", required = false) String error) {
		addMessages(model);
		if (error != null) {
			logger.info("if error - " + error);
			model.addObject("error", messageSource.getMessage("error.loginpage.wrongLoginOrPassword", null, null));
		}
		
		if (logout != null) {
			logger.info("if logout - " + logout);
			model.addObject("message", messageSource.getMessage("info.loginpage.logoutSuccessful", null, null));
		}
		
		logger.info("/login");
		model.addObject("newUser", new User());
		model.addObject("signUpError", "");
		
		model.setViewName("login");
		return model;
	}

	
}
