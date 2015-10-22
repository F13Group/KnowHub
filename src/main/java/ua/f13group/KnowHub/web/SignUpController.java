/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.f13group.KnowHub.web;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.service.UserService;

/**
 *
 * @author amd
 */
@Controller
public class SignUpController implements MessageSourceAware {
    
	private MessageSource messageSource;
	
	@Override
	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;		
	}
	
	public boolean checkWithRegExp(String string,String regexp){  
	       Pattern p = Pattern.compile(regexp);  
	       Matcher m = p.matcher(string);  
	       return m.matches();  
	}
	
    @Autowired
    private UserService userService;
    
    private void addMessages(ModelAndView model) {
    	model.addObject("loginInstructions",
				messageSource.getMessage("info.signuppage.loginInstructions", null, null));
        model.addObject("passwordInstructions",
				messageSource.getMessage("info.signuppage.passwordInstructions", null, null));
        model.addObject("confirmDialogText",
				messageSource.getMessage("info.signuppage.confirmDialogText", null, null));
        
        model.addObject("errorLoginEmpty",
				messageSource.getMessage("error.signuppage.loginEmpty", null, null));
        model.addObject("errorLoginNotEmail",
				messageSource.getMessage("error.signuppage.loginNotEmail", null, null));
        model.addObject("errorLoginExistsAlready",
				messageSource.getMessage("error.signuppage.loginExistsAlready", null, null));
        model.addObject("errorPasswordEmpty",
				messageSource.getMessage("error.signuppage.passwordEmpty", null, null));
        model.addObject("errorPasswordBadlyFormed",
				messageSource.getMessage("error.signuppage.passwordBadlyFormed", null, null));
        model.addObject("errorPasswordTooLong",
				messageSource.getMessage("error.signuppage.passwordTooLong", null, null));
        model.addObject("errorPassword2Empty",
				messageSource.getMessage("error.signuppage.password2Empty", null, null));
        model.addObject("errorPassword2NoMatch",
				messageSource.getMessage("error.signuppage.password2NoMatch", null, null));
    }
    
    @RequestMapping(value = "/signup",method = RequestMethod.GET)
	public ModelAndView signup(ModelAndView model) {
            model.addObject("newUser", new User());
            model.addObject("signUpError", "");
            
            addMessages(model);
            
            model.setViewName("signup");
            return model;
	}
    
    @RequestMapping(value = "/signup",method = RequestMethod.POST)
	public ModelAndView signup(@Valid final User newUser, final BindingResult result, ModelAndView model) {
            if (result.hasErrors()) {
                model.addObject("newUser", newUser);
                model.addObject("signUpError", "");
                
                addMessages(model);
                
                return model;
            }
            newUser.setLogin(newUser.getLogin().trim().toLowerCase());
            
            if(!(newUser.getLogin().endsWith("@epam.com") &&
            		newUser.getLogin().contains("_") && 
            		newUser.getPassword().equals(newUser.getPassword2()) && (
            		this.checkWithRegExp(newUser.getPassword(), "((?=.*\\d)(?=.*[a-z]).{8,})") ||
            		this.checkWithRegExp(newUser.getPassword(), "((?=.*\\d)(?=.*[A-Z]).{8,})") ||
            		this.checkWithRegExp(newUser.getPassword(), "((?=.*\\d)(?=.*[~\\@\\#\\$\\%\\^\\+\\-\\=\\[\\]*()/{}\\?!|:;_<>]).{8,})") ||
            		this.checkWithRegExp(newUser.getPassword(), "((?=.*[a-z])(?=.*[A-Z]).{8,})") ||
            		this.checkWithRegExp(newUser.getPassword(), "((?=.*[a-z])(?=.*[~\\@\\#\\$\\%\\^\\+\\-\\=\\[\\]*()/{}\\?!|:;_<>]).{8,})") ||
            		this.checkWithRegExp(newUser.getPassword(), "((?=.*[A-Z])(?=.*[~\\@\\#\\$\\%\\^\\+\\-\\=\\[\\]*()/{}\\?!|:;_<>]).{8,})") ||
            		(newUser.getPassword().contains(newUser.getFirstname())) ||
            		(newUser.getPassword().contains(newUser.getLastname())) ||
            		this.checkWithRegExp(newUser.getFirstname(), "(?=.*[~\\@\\#\\$\\%\\^\\+\\-\\=\\[\\]*()/{}\\?!|:;_<>])") ||
            		this.checkWithRegExp(newUser.getLastname(), "(?=.*[~\\@\\#\\$\\%\\^\\+\\-\\=\\[\\]*()/{}\\?!|:;_<>])")
            		))){
            	model.setViewName("notification");
            	model.addObject("error", "ValidationFail");
            	model.addObject("notificationMessage",
        				messageSource.getMessage("info.notificationpage.serverValidationError",
        						null, null));
            	return model; 
            }
            
            User user = userService.getUserByLogin(newUser.getLogin());
            if (user != null && user.isConfirmed()) {            	
            	result.rejectValue("login", "error.newUser", "Email already exists");
            	model.addObject("newUser", newUser);
            	model.addObject("signUpError", "Email already exists");
            	
            	addMessages(model);
            	
            	return model;
            }
            
            //done by Oleksandr
            PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            newUser.setPassword(passwordEncoder.encode(newUser.getPassword()));
            newUser.setPassword2(null);
            
            if (user !=null && user.isConfirmed() == false){
            	userService.updateUser(newUser);
            	model.addObject("newUser", newUser);
            	model.addObject("notificationMessage",
        				messageSource.getMessage("info.notificationpage.emailSent",
        						new Object[] { newUser.getLogin() }, null));
            	model.setViewName("notification");
            	return model;
            }
            else {
            	if (userService.saveUser(newUser) != null) {
                	model.addObject("newUser", newUser);
                	model.addObject("notificationMessage",
            				messageSource.getMessage("info.notificationpage.emailSent",
            						new Object[] { newUser.getLogin() }, null));
                	model.setViewName("notification");
                	return model;
                } else {
                	model.addObject("newUser", new User());
                	model.addObject("signUpError", "");
                	
                	addMessages(model);
                	
                	model.setViewName("signup");
                	return model;
                }
            }            
	}
}
