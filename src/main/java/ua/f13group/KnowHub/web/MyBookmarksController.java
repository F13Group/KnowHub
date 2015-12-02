package ua.f13group.KnowHub.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ua.f13group.KnowHub.service.QuestionService;
import ua.f13group.KnowHub.service.UserService;

@Controller
public class MyBookmarksController {

	@Autowired
	UserService userService;

	@RequestMapping(value="mybookmarks/{userId}", method = RequestMethod.GET)
	public String loadMyBookmarks(@PathVariable String userId, Model model, Principal principal ){
		if (principal == null){
			return "redirect:/";
		}
		else {
			
			String login = principal.getName();
			String principalId = userService.getUserByLogin(login).getUserId().toString();
			if (userId.equals(principalId)){
				model.addAttribute("userId", userId);
				return "mybookmarks";
			}
			else {
				return "redirect:/";
			}
		}
		
	}
	
}
