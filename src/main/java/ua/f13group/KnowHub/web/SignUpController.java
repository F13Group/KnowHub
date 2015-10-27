/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.f13group.KnowHub.web;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
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
public class SignUpController extends AbstractSignUpController {
	
    @Autowired
    private UserService userService;
    
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
