package ua.f13group.KnowHub.web.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.service.QuestionService;

@RestController
@RequestMapping(value = "/questions")
public class QuestionController {

	@Autowired
	QuestionService questionService;

	@RequestMapping(method = RequestMethod.GET)
	public List<Question> getAllQuestions() {
		return questionService.findAll();
	}

	// @RequestMapping(method = RequestMethod.GET)
	// public List<Question> getAllQuestionsFilterCategory(@ReqsuestParam ) {
	// Category category = new Category();
	// category.setId(categoryId);
	// return questionService.findByCategory(category);
	// }

	@RequestMapping(value = "/categories/{categoryId}", method = RequestMethod.GET)
	public List<Question> getAllQuestionsFilterCategory2(
			@PathVariable Long categoryId) {
		Category category = new Category();
		category.setId(categoryId);
		return questionService.findByCategory(category);
	}

}
