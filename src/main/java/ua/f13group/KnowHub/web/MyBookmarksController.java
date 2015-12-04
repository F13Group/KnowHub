package ua.f13group.KnowHub.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyBookmarksController {

	@RequestMapping(value="myBookmarks")
	public String loadMyBookmarks(){
		return "myBookmarks";
	}
	
}
