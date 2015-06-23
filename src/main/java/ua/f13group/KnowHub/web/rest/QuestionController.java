package ua.f13group.KnowHub.web.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.service.QuestionService;
import ua.f13group.KnowHub.web.client.ClientManager;
import ua.f13group.KnowHub.web.dto.QuestionMetadata;

@RestController
@RequestMapping(value = "/questions")
public class QuestionController {

	@Autowired
	QuestionService questionService;

	@Autowired
	ClientManager clientManager;

	@ModelAttribute
	public void paginationHolding(
			@RequestParam(required = false) Integer currentPage) {
		if (currentPage != null && currentPage <= clientManager.getPageAmount()
				&& currentPage > 0)
			clientManager.setCurrentPage(currentPage);
	}

	@RequestMapping(method = RequestMethod.GET)
	public List<Question> getAllQuestions() {
		return questionService.getQuestionsForPage(clientManager.getPageSize(),
				clientManager.getCurrentPage());
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
		clientManager.setPageAmount(questionService.getPagesCount());
		Category category = new Category();
		category.setId(categoryId);
		return questionService.getQuestionsForPage(category,
				clientManager.getPageSize(), clientManager.getCurrentPage());
	}

	@RequestMapping(value = "/metadata", method = RequestMethod.POST)
	public QuestionMetadata getMetadata(@RequestParam Integer currentPage) {
		return new QuestionMetadata(clientManager.getCurrentPage(),
				clientManager.getPageAmount());
	}

}
