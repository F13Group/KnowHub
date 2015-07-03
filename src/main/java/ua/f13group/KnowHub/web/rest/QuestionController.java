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
import ua.f13group.KnowHub.domain.QuestionSortConfig;
import ua.f13group.KnowHub.service.QuestionService;
import ua.f13group.KnowHub.web.dto.PageMetadata;
import ua.f13group.KnowHub.web.dto.QuestionMetadata;

@RestController
@RequestMapping(value = "/questions")
public class QuestionController {

	@Autowired
	QuestionService questionService;

	public static final String DEFAULT_ROWS_ON_PAGE_NUMBER = "7";
	public static final String DEFAULT_CURRENT_PAGE_NUMBER = "1";
	public static final String DEFAULT_SORT_COLUMN_INDEX = "1";

	//
	// @ModelAttribute
	// public int paginationHolding(
	// @RequestParam(value = "currentPage", required = false) Integer
	// currentPage) {
	// return 5;
	//
	// }

	@RequestMapping(method = RequestMethod.POST)
	public List<Question> getAllQuestions(
			@RequestParam(value = "currentPageNumber", required = false, defaultValue = DEFAULT_CURRENT_PAGE_NUMBER) Integer currentPageNumber,
			@RequestParam(value = "rowsOnPageNumber", required = false, defaultValue = DEFAULT_ROWS_ON_PAGE_NUMBER) Integer rowsOnPageNumber,
			@RequestParam(value = "sortColumnIndex", required = false, defaultValue = DEFAULT_SORT_COLUMN_INDEX) Integer sortColumnIndex) {
		if (sortColumnIndex < 0)
			sortColumnIndex *= -1;

		QuestionSortConfig sortColumn = QuestionSortConfig.values()[sortColumnIndex];
		
		return questionService.getQuestionsForPage(rowsOnPageNumber,
				currentPageNumber);
	}

	@RequestMapping(value = "/categories/{categoryId}", method = RequestMethod.POST)
	public List<Question> getAllQuestionsFilterCategory(
			@PathVariable Long categoryId,
			@RequestParam(value = "currentPageNumber", required = false, defaultValue = DEFAULT_CURRENT_PAGE_NUMBER) Integer currentPageNumber,
			@RequestParam(value = "rowsOnPageNumber", required = false, defaultValue = DEFAULT_ROWS_ON_PAGE_NUMBER) Integer rowsOnPageNumber,
			@RequestParam(value = "sortColumnIndex", required = false, defaultValue = DEFAULT_SORT_COLUMN_INDEX) Integer sortColumnIndex) {
		if (sortColumnIndex < 0)
			sortColumnIndex *= -1;

		QuestionSortConfig sortColumn = QuestionSortConfig.values()[sortColumnIndex];

		return questionService.getQuestionsForPage(new Category(categoryId),
				rowsOnPageNumber, currentPageNumber);
	}

	@RequestMapping(value = "/metadata", method = RequestMethod.POST)
	public QuestionMetadata getMetadata(
			@RequestParam(value = "rowsOnPageNumber") Integer rowsOnPageNumber) {

		return new QuestionMetadata(
				questionService.getPagesCount(rowsOnPageNumber),
				questionService.getRecordsCount());
	}

	@RequestMapping(value = "/categories/{categoryId}/metadata", method = RequestMethod.POST)
	public QuestionMetadata getMetadataforCategory(
			@PathVariable Long categoryId,
			@RequestParam(value = "rowsOnPageNumber") Integer rowsOnPageNumber) {
		Category category = new Category(categoryId);
		return new QuestionMetadata(questionService.getPagesCount(category,
				rowsOnPageNumber), questionService.getRecordsCount(category));

	}

	@RequestMapping(value = "/pagemetadata", method = RequestMethod.GET)
	public PageMetadata getMetadata() {

		return new PageMetadata();
	}

}
