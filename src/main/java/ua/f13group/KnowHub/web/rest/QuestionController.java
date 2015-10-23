package ua.f13group.KnowHub.web.rest;

import java.security.Principal;
import java.util.ArrayList;
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
import ua.f13group.KnowHub.domain.Rating;
import ua.f13group.KnowHub.service.QuestionService;
import ua.f13group.KnowHub.service.RatingService;
import ua.f13group.KnowHub.service.UserService;
import ua.f13group.KnowHub.web.dto.PageMetadata;
import ua.f13group.KnowHub.web.dto.QuestionFrequentAskedDTO;
import ua.f13group.KnowHub.web.dto.QuestionMetadata;

@RestController
@RequestMapping(value = "/questions")
public class QuestionController {

	@Autowired
	QuestionService questionService;

	@Autowired
	RatingService ratingService;

	@Autowired
	UserService userService;

	public static final String DEFAULT_ROWS_ON_PAGE_NUMBER = "7";
	public static final String DEFAULT_CURRENT_PAGE_NUMBER = "1";
	public static final String DEFAULT_SORT_COLUMN_INDEX = "1";
	public static final Integer DEFAULT_NOT_LOGGED_USER = null;
	public static final Integer DEFAULT_LIST_SIZE = 100;

	//
	// @ModelAttribute
	// public int paginationHolding(
	// @RequestParam(value = "currentPage", required = false) Integer
	// currentPage) {
	// return 5;
	//
	// }

	@RequestMapping(method = RequestMethod.POST)
	public List<QuestionFrequentAskedDTO> getAllQuestions(
			@RequestParam(value = "currentPageNumber", required = false, defaultValue = DEFAULT_CURRENT_PAGE_NUMBER) Integer currentPageNumber,
			@RequestParam(value = "rowsOnPageNumber", required = false, defaultValue = DEFAULT_ROWS_ON_PAGE_NUMBER) Integer rowsOnPageNumber,
			@RequestParam(value = "sortColumnIndex", required = false, defaultValue = DEFAULT_SORT_COLUMN_INDEX) Integer sortColumnIndex,
			Principal principal) {		

		boolean guestLogin = false;
		Long userId = null;
		if (principal == null) {
			guestLogin = true;
		} else {
		String login = principal.getName();
		userId = userService.getUserByLogin(login).getUserId();
		}
		List<Question> list = questionService.getQuestionsForPage(
				rowsOnPageNumber,
				currentPageNumber,
				sortConfig(sortColumnIndex),
				ascending(sortColumnIndex));

		List<QuestionFrequentAskedDTO> questionFrequentAskedUserList = new ArrayList<>(DEFAULT_LIST_SIZE);
		Boolean isAsked;
		for (Question question : list) {
			Long questionId = question.getId();
			Long rating = ratingService.countLikesByQuestionId(questionId);
			isAsked = false;
			if (!guestLogin) {
				isAsked = ratingService.ifLiked(userId, questionId);			
			} 
			QuestionFrequentAskedDTO item = new QuestionFrequentAskedDTO(
					questionId, 
					question.getValue(),
					question.getLoadDate(),
					question.getCategory(),
					question.getTags(),
					rating,  
					isAsked);
			questionFrequentAskedUserList.add(item);
		}

		return questionFrequentAskedUserList;		
	}

	@RequestMapping(value = "/categories/{categoryId}", method = RequestMethod.POST)
	public List<QuestionFrequentAskedDTO> getAllQuestionsFilterCategory(
			@PathVariable Long categoryId,
			@RequestParam(value = "currentPageNumber", required = false, defaultValue = DEFAULT_CURRENT_PAGE_NUMBER) Integer currentPageNumber,
			@RequestParam(value = "rowsOnPageNumber", required = false, defaultValue = DEFAULT_ROWS_ON_PAGE_NUMBER) Integer rowsOnPageNumber,
			@RequestParam(value = "sortColumnIndex", required = false, defaultValue = DEFAULT_SORT_COLUMN_INDEX) Integer sortColumnIndex,
			Principal principal) {		

		boolean guestLogin = false;
		Long userId = null;
		if (principal == null) {
			guestLogin = true;
		} else {
		String login = principal.getName();
		userId = userService.getUserByLogin(login).getUserId();
		}
		
		List<Question> list = questionService.getQuestionsForPage(
				new Category(categoryId),
				rowsOnPageNumber,
				currentPageNumber,
				sortConfig(sortColumnIndex),
				ascending(sortColumnIndex));

		List<QuestionFrequentAskedDTO> questionFrequentAskedUserList = new ArrayList<>(DEFAULT_LIST_SIZE);
		Boolean isAsked;
		for (Question question : list) {
			Long questionId = question.getId();
			Long rating = ratingService.countLikesByQuestionId(questionId);
			isAsked = false;
			if (!guestLogin) {
				isAsked = ratingService.ifLiked(userId, questionId);			
			} 
			QuestionFrequentAskedDTO item = new QuestionFrequentAskedDTO(
					questionId, 
					question.getValue(),
					question.getLoadDate(),
					question.getCategory(),
					question.getTags(),
					rating,  
					isAsked);
			questionFrequentAskedUserList.add(item);
		}

		return questionFrequentAskedUserList;
	}

	private QuestionSortConfig sortConfig(Integer sortColumnIndex) {
		return QuestionSortConfig.values()[Math.abs(sortColumnIndex) - 1];
	}

	private boolean ascending(Integer sortColumnIndex) {
		return sortColumnIndex < 0 ? false : true;
	}

	@RequestMapping(value = {"/rate", "/categories/{categoryId}/rate"}, method = RequestMethod.POST)
	public Boolean rateQuestion(
			Principal principal,
			@RequestParam(value = "questionId", required = false) Long questionId){
		
		
		Long userId = null;
		if (principal == null) {
			return false;
		} else {
		String login = principal.getName();
		userId = userService.getUserByLogin(login).getUserId();
		}
		
		if (questionId <= 0 ) {			
			return false;
		}

		Rating rating = new Rating();
		rating.setUserId(userId);
		rating.setQuestionId(questionId);
		ratingService.save(rating);		
		return true;
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