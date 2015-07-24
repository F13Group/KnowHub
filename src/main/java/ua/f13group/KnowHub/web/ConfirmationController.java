package ua.f13group.KnowHub.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ua.f13group.KnowHub.service.UserService;

@Controller
public class ConfirmationController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/confirmation/{userlink}",method = RequestMethod.GET)
	public String confirm(@PathVariable String userlink){
		userService.confirmUser(userlink);
			
		
		return "confirmed";
		
	}
}
