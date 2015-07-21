package ua.f13group.KnowHub.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping({ "/","/index" })
public class HomePageController {

	@RequestMapping(method = RequestMethod.GET)
	public String homePageAll() {
		return "index";
	}
}
