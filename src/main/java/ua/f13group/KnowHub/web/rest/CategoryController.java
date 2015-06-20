package ua.f13group.KnowHub.web.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.service.CategoryService;

@RestController
@RequestMapping(value = "/category")
@ImportResource("classpath:spring/spring-config.xml")
public class CategoryController {

	@Autowired
	CategoryService categoryService;

	@RequestMapping(method = RequestMethod.GET)
	public List<Category> getAllCategories() {
		System.out.println("HELLO!~");
		for (Category c : categoryService.findAll()) {
			System.out.println(c);
			for(Question q: c.getQuestions()){
				System.out.println(" - q - "+q);
			}
		}
		return categoryService.findAll();
	}

}
