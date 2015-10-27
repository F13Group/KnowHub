package ua.f13group.KnowHub.web;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.service.UserService;

/*
 * Date of creation 19.10.2015
 * @author Dmytro Derzhevytskyi
 * @since 1.8
 */

@Controller
public class LoginController implements MessageSourceAware {

	private static final Logger logger = Logger.getLogger(LoginController.class);

	private MessageSource messageSource;

	@Override
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}

	@Autowired
	private UserService userService;

	public boolean checkWithRegExp(String string, String regexp) {
		Pattern p = Pattern.compile(regexp);
		Matcher m = p.matcher(string);
		return m.matches();
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView signup(ModelAndView model, @RequestParam(value = "error", required = false) String error) {
		if (error != null) {
			model.addObject("error", "Invalid username or password!");
		}
		model.addObject("newUser", new User());
		model.addObject("signUpError", "");

		addMessages(model);

		model.setViewName("login");
		return model;
	}

	@RequestMapping(value = "/login/{error}", method = RequestMethod.GET)
	public final ModelAndView displayLoginform(ModelAndView model, @PathVariable String error,
			HttpServletRequest request) {
		model.addObject("newUser", new User());
		model.addObject("signUpError", "");

		addMessages(model);
		if (error.equalsIgnoreCase("accountDisabled")) {
			model.addObject("error", "You are disabled");
			logger.info("You are disabled");
		}
		if (error.equalsIgnoreCase("badCredentials")) {
			model.addObject("error", "Wrong username or password");
			logger.info("Wrong username or password");
		}

		if (error.equalsIgnoreCase("credentialsExpired")) {
			model.addObject("error", "Credentials expired");
		}

		if (error.equalsIgnoreCase("accountLocked")) {
			model.addObject("error", "Credentials expired");
		}
		model.setViewName("login");
		return model;
	}

	private void addMessages(ModelAndView model) {
		model.addObject("loginInstructions", messageSource.getMessage("info.signuppage.loginInstructions", null, null));
		model.addObject("passwordInstructions",
				messageSource.getMessage("info.signuppage.passwordInstructions", null, null));
		model.addObject("confirmDialogText", messageSource.getMessage("info.signuppage.confirmDialogText", null, null));

		model.addObject("errorLoginEmpty", messageSource.getMessage("error.signuppage.loginEmpty", null, null));
		model.addObject("errorLoginNotEmail", messageSource.getMessage("error.signuppage.loginNotEmail", null, null));
		model.addObject("errorLoginExistsAlready",
				messageSource.getMessage("error.signuppage.loginExistsAlready", null, null));
		model.addObject("errorPasswordEmpty", messageSource.getMessage("error.signuppage.passwordEmpty", null, null));
		model.addObject("errorPasswordBadlyFormed",
				messageSource.getMessage("error.signuppage.passwordBadlyFormed", null, null));
		model.addObject("errorPasswordTooLong",
				messageSource.getMessage("error.signuppage.passwordTooLong", null, null));
		model.addObject("errorPassword2Empty", messageSource.getMessage("error.signuppage.password2Empty", null, null));
		model.addObject("errorPassword2NoMatch",
				messageSource.getMessage("error.signuppage.password2NoMatch", null, null));
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView signup(@Valid final User newUser, final BindingResult result, ModelAndView model) {
		if (result.hasErrors()) {
			model.addObject("newUser", newUser);
			model.addObject("signUpError", "");
			System.out.println("error");
			addMessages(model);
			model.setViewName("login");
			return model;
		}
		if (!(newUser.getLogin().endsWith("@epam.com") && newUser.getLogin().contains("_")
				&& (this.checkWithRegExp(newUser.getPassword(), "((?=.*\\d)(?=.*[a-z]).{8,})")
						|| this.checkWithRegExp(newUser.getPassword(), "((?=.*\\d)(?=.*[A-Z]).{8,})")
						|| this.checkWithRegExp(newUser.getPassword(),
								"((?=.*\\d)(?=.*[~\\@\\#\\$\\%\\^\\+\\-\\=\\[\\]*()/{}\\?!|:;_<>]).{8,})")
				|| this.checkWithRegExp(newUser.getPassword(), "((?=.*[a-z])(?=.*[A-Z]).{8,})")
				|| this.checkWithRegExp(newUser.getPassword(),
						"((?=.*[a-z])(?=.*[~\\@\\#\\$\\%\\^\\+\\-\\=\\[\\]*()/{}\\?!|:;_<>]).{8,})")
				|| this.checkWithRegExp(newUser.getPassword(),
						"((?=.*[A-Z])(?=.*[~\\@\\#\\$\\%\\^\\+\\-\\=\\[\\]*()/{}\\?!|:;_<>]).{8,})")
				|| (newUser.getPassword().contains(newUser.getFirstname()))
				|| (newUser.getPassword().contains(newUser.getLastname()))
				|| this.checkWithRegExp(newUser.getFirstname(),
						"(?=.*[~\\@\\#\\$\\%\\^\\+\\-\\=\\[\\]*()/{}\\?!|:;_<>])")
				|| this.checkWithRegExp(newUser.getLastname(),
						"(?=.*[~\\@\\#\\$\\%\\^\\+\\-\\=\\[\\]*()/{}\\?!|:;_<>])")))) {
			model.setViewName("notification");
			model.addObject("error", "ValidationFail");
			model.addObject("notificationMessage",
					messageSource.getMessage("info.notificationpage.serverValidationError", null, null));
			return model;
		}
		System.out.println(newUser.getLogin());
		System.out.println("userService" + userService.getUserByLogin(newUser.getLogin()));

		// if(userService.getUserByLogin(newUser.getLogin()) == null &&
		// newUser.getPassword() != passwordEncoder.){
		// System.out.println("userService validation");
		// model.setViewName("notification");
		// model.addObject("error", "ValidationFail");
		// model.addObject("notificationMessage",
		// messageSource.getMessage("info.notificationpage.serverValidationError",
		// null, null));
		// }
		System.out.println("index");
		model.setViewName("redirect:/index");
		return model;
	}

}
