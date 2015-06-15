package ua.f13group.KnowHub.web.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController(value="/category")
public class CategoryController {
	
	@Autowired
	CategoryService categoryService;
	
	 @RequestMapping(method = RequestMethod.GET)
	 public List<Category> getAllCategories() {
	        return categoryService.findAll();
	    }
	 

}
