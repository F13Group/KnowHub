package ua.f13group.KnowHub.web;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.service.UserService;

@Controller
public class SignUpController extends AbstractSignUpController {
	
    @Autowired
    private UserService userService;
    
    @RequestMapping(value = "/signup",method = RequestMethod.GET)
	public String signup(Model model) {
            model.addAttribute("newUser", new User());
            model.addAttribute("signUpError", "");
            
            addMessages(model);
            
            return "signup";
	}
    
    @RequestMapping(value = "/signup",method = RequestMethod.POST)
	public String signup(@Valid final User newUser, final BindingResult result, Model model) {
            if (result.hasErrors()) {
                model.addAttribute("newUser", newUser);
                model.addAttribute("signUpError", "");
                
                addMessages(model);
                
                return "signup";
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
            	model.addAttribute("error", "ValidationFail");
            	model.addAttribute("notificationMessage",
						messageSource.getMessage("info.notificationpage.serverValidationError",
								null, null));
            	return "notification";
            }
            
            User user = userService.getUserByLogin(newUser.getLogin());
            if (user != null && user.isConfirmed()) {            	
            	result.rejectValue("login", "error.newUser", "Email already exists");
            	model.addAttribute("newUser", newUser);
            	model.addAttribute("signUpError", "Email already exists");
            	
            	addMessages(model);
            	
            	return "signup";
            }
            
            
            PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            newUser.setPassword(passwordEncoder.encode(newUser.getPassword()));
            newUser.setPassword2(null);
            
            if (user != null && user.isConfirmed() == false){
            	user.setPassword(newUser.getPassword());
            	userService.updateUser(user);            	
            	model.addAttribute("newUser", newUser);
            	model.addAttribute("notificationMessage",
						messageSource.getMessage("info.notificationpage.emailSent",
								new Object[]{newUser.getLogin()}, null));            	
            	return "notification";
            }
            else {
            	if (userService.saveUser(newUser) != null) {
                	model.addAttribute("newUser", newUser);
                	model.addAttribute("notificationMessage",
							messageSource.getMessage("info.notificationpage.emailSent",
									new Object[]{newUser.getLogin()}, null));                	
                	return "notification";
                } else {
                	model.addAttribute("newUser", new User());
                	model.addAttribute("signUpError", "");
                	
                	addMessages(model);                	
                	
                	return "signup";
                }
            }            
	}
}
