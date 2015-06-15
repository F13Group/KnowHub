package ua.f13group.KnowHub.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Web {


	String message = "Welcome to Spring MVC!";
 
	@RequestMapping("/hello")
	public @ResponseBody String showMessage(
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {
		System.out.println("in controller");

		return message;
	}
}