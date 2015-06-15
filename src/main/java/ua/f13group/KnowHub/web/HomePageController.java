package ua.f13group.KnowHub.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping({ "/", "/home" })
public class HomePageController {
	static{
		System.out.println("HomeControler");
	}
	@RequestMapping(method = RequestMethod.GET)
	public String homePage(Map<String, Object> model) {
		System.out.println("homePage()");
		return "homePage";
	}
}
