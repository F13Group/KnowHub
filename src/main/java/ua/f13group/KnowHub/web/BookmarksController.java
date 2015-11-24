package ua.f13group.KnowHub.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookmarksController {

	@RequestMapping(value="bookmarks")
	public String myBookmarksPageLoad(){
		return "my_bookmarks";
	}
	
}
