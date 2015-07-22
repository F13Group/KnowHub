/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.f13group.KnowHub.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.service.PropertyService;
import ua.f13group.KnowHub.service.UserService;

/**
 *
 * @author amd
 */
@Controller
public class SignUpController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private ShaPasswordEncoder passwordEncoder;
    
    @RequestMapping(value = "/signup",method = RequestMethod.GET)
	public ModelAndView signup(ModelAndView model) {
            model.addObject("newUser", new User());
            model.setViewName("signup");
            return model;
	}
    
    @RequestMapping(value = "/signup",method = RequestMethod.POST)
	public ModelAndView signup(@Valid final User newUser, final BindingResult result, ModelAndView model) {
            if (result.hasErrors()) {
                model.addObject("newUser", newUser);
                return model;
            }
            User user =userService.getUserByLogin(newUser.getLogin());
            if (user != null && user.isConfirmed()){
            	
            	result.rejectValue("login", "error.newUser", "Email already exists");
            	return model;
            }
            
            newUser.setPassword(passwordEncoder.encodePassword(newUser.getPassword(), newUser.getLogin()));
            newUser.setPassword2(null);
            userService.saveUser(newUser);
            
            model.addObject("newUser", new User());
            model.setViewName("signup");
            return model;
	}
}
