package ua.f13group.KnowHub.web.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.service.QuestionService;
import ua.f13group.KnowHub.web.dto.QuestionMetadata;

@RestController
@RequestMapping(value = "/questions")
public class QuestionController {

	@Autowired
	QuestionService questionService;

	public static final int DEFAULT_ROWS_ON_PAGE_NUMBER = 10;
	public static final int DEFAULT_CURRENT_PAGE_NUMBER = 1;
//
//	@ModelAttribute
//	public int paginationHolding(
//			@RequestParam(value = "currentPage", required = false) Integer currentPage) {
//		return 5;
//
//	}

	@RequestMapping(method = RequestMethod.POST)
	public List<Question> getAllQuestions(
			@RequestParam(value = "currentPageNumber", required = false) Integer currentPageNumber,
			@RequestParam(value = "rowsOnPageNumber", required = false) Integer rowsOnPageNumber) {

		if (currentPageNumber == null)
			currentPageNumber = DEFAULT_CURRENT_PAGE_NUMBER;
		if (rowsOnPageNumber == null)
			rowsOnPageNumber = DEFAULT_ROWS_ON_PAGE_NUMBER;

		return questionService.getQuestionsForPage(rowsOnPageNumber,
				currentPageNumber);
	}

	@RequestMapping(value = "/categories/{categoryId}", method = RequestMethod.POST)
	public List<Question> getAllQuestionsFilterCategory(
			@PathVariable Long categoryId,
			@RequestParam(value = "currentPageNumber", required = false) Integer currentPageNumber,
			@RequestParam(value = "rowsOnPageNumber", required = false) Integer rowsOnPageNumber) {

		if (currentPageNumber == null)
			currentPageNumber = DEFAULT_CURRENT_PAGE_NUMBER;
		if (rowsOnPageNumber == null)
			rowsOnPageNumber = DEFAULT_ROWS_ON_PAGE_NUMBER;

		return questionService.getQuestionsForPage(new Category(categoryId),
				rowsOnPageNumber, currentPageNumber);
	}

	@RequestMapping(value = "/metadata", method = RequestMethod.POST)
	public QuestionMetadata getMetadata(
			@RequestParam(value = "rowsOnPageNumber") Integer rowsOnPageNumber) {

		return new QuestionMetadata(
				questionService.getPagesCount(rowsOnPageNumber));
	}

	@RequestMapping(value = "/categories/{categoryId}/metadata", method = RequestMethod.POST)
	public QuestionMetadata getMetadataforCategory(
			@PathVariable Long categoryId,
			@RequestParam(value = "rowsOnPageNumber") Integer rowsOnPageNumber) {

		return new QuestionMetadata(questionService.getPagesCount(new Category(
				categoryId), rowsOnPageNumber));

	}

}
