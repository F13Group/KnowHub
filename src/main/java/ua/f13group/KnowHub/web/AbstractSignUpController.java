package ua.f13group.KnowHub.web;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.ui.Model;
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
	
	protected void addMessages(Model model) {
		model.addAttribute("loginInstructions", messageSource.getMessage("info.signuppage.loginInstructions", null, null));
		model.addAttribute("passwordInstructions", messageSource.getMessage("info.signuppage.passwordInstructions", null, null));
		model.addAttribute("confirmDialogText", messageSource.getMessage("info.signuppage.confirmDialogText", null, null));
		model.addAttribute("errorLoginEmpty", messageSource.getMessage("error.signuppage.loginEmpty", null, null));
		model.addAttribute("errorLoginNotEmail", messageSource.getMessage("error.signuppage.loginNotEmail", null, null));
		model.addAttribute("errorLoginExistsAlready", messageSource.getMessage("error.signuppage.loginExistsAlready", null, null));
		model.addAttribute("errorPasswordEmpty", messageSource.getMessage("error.signuppage.passwordEmpty", null, null));
		model.addAttribute("errorPasswordBadlyFormed", messageSource.getMessage("error.signuppage.passwordBadlyFormed", null, null));
		model.addAttribute("errorPasswordTooLong",	messageSource.getMessage("error.signuppage.passwordTooLong", null, null));
		model.addAttribute("errorPassword2Empty", messageSource.getMessage("error.signuppage.password2Empty", null, null));
		model.addAttribute("errorPassword2NoMatch", messageSource.getMessage("error.signuppage.password2NoMatch", null, null));
		model.addAttribute("infoPleaseEnterEmail", messageSource.getMessage("info.loginpage.pleaseEnterEmail", null, null));
		model.addAttribute("infoPleaseEnterPassword", messageSource.getMessage("info.loginpage.pleaseEnterPassword", null, null));
	}
}
