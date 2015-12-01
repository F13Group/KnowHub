package ua.f13group.KnowHub.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ua.f13group.KnowHub.service.UserService;

@Controller
@RequestMapping({ "/","/index" })
public class HomePageController {

	@Autowired
	UserService userService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String homePageAll(Model model, Principal principal) {
		String userId = "";
		if (principal != null){
			String login = principal.getName();
			userId = userService.getUserByLogin(login).getUserId().toString();
		}
		model.addAttribute("userId", userId);
		
		return "index";
	}
}
