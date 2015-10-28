package ua.f13group.KnowHub.web;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.web.servlet.ModelAndView;

public abstract class AbstractSignUpController implements MessageSourceAware {

	
	protected MessageSource messageSource;

	@Override
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}

	protected boolean checkWithRegExp(String string, String regexp) {
		Pattern p = Pattern.compile(regexp);
		Matcher m = p.matcher(string);
		return m.matches();
	}
	
	protected void addMessages(ModelAndView model) {
		model.addObject("loginInstructions", messageSource.getMessage("info.signuppage.loginInstructions", null, null));
		model.addObject("passwordInstructions", messageSource.getMessage("info.signuppage.passwordInstructions", null, null));
		model.addObject("confirmDialogText", messageSource.getMessage("info.signuppage.confirmDialogText", null, null));
		model.addObject("errorLoginEmpty", messageSource.getMessage("error.signuppage.loginEmpty", null, null));
		model.addObject("errorLoginNotEmail", messageSource.getMessage("error.signuppage.loginNotEmail", null, null));
		model.addObject("errorLoginExistsAlready", messageSource.getMessage("error.signuppage.loginExistsAlready", null, null));
		model.addObject("errorPasswordEmpty", messageSource.getMessage("error.signuppage.passwordEmpty", null, null));
		model.addObject("errorPasswordBadlyFormed", messageSource.getMessage("error.signuppage.passwordBadlyFormed", null, null));
		model.addObject("errorPasswordTooLong",	messageSource.getMessage("error.signuppage.passwordTooLong", null, null));
		model.addObject("errorPassword2Empty", messageSource.getMessage("error.signuppage.password2Empty", null, null));
		model.addObject("errorPassword2NoMatch", messageSource.getMessage("error.signuppage.password2NoMatch", null, null));
		model.addObject("infoPleaseEnterEmail", messageSource.getMessage("info.loginpage.pleaseEnterEmail", null, null));
		model.addObject("infoPleaseEnterPassword", messageSource.getMessage("info.loginpage.pleaseEnterPassword", null, null));
	}
}
