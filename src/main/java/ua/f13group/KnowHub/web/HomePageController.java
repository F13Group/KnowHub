package ua.f13group.KnowHub.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping({ "/" })
public class HomePageController {
	
	@RequestMapping(method = RequestMethod.GET)
	//public String homePageAll(Map<String, Object> model) {  
	public String homePageAll() {
		return "homePage";
	}  
}
