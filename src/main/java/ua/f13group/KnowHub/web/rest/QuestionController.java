package ua.f13group.KnowHub.web.rest;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ua.f13group.KnowHub.domain.*;
import ua.f13group.KnowHub.service.BookmarkService;
import ua.f13group.KnowHub.service.QuestionService;
import ua.f13group.KnowHub.service.RatingService;
import ua.f13group.KnowHub.service.UserService;
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

    @Autowired
    BookmarkService bookmarkService;

    public static final String DEFAULT_ROWS_ON_PAGE_NUMBER = "7";
    public static final String DEFAULT_CURRENT_PAGE_NUMBER = "1";
    public static final String DEFAULT_SORT_COLUMN_INDEX = "1";
    public static final Integer DEFAULT_NOT_LOGGED_USER = null;
    public static final Integer DEFAULT_LIST_SIZE = 100;
    
    private Long determineUserId(Principal principal) {
    	if (principal == null) {
        	return (long) 0;
        } else {            
            return userService.getUserByLogin(principal.getName()).getUserId();
        }
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public List<QuestionFrequentAskedDTO> getAllQuestions(
            @RequestParam(value = "currentPageNumber", required = false, defaultValue = DEFAULT_CURRENT_PAGE_NUMBER) Integer currentPageNumber,
            @RequestParam(value = "rowsOnPageNumber", required = false, defaultValue = DEFAULT_ROWS_ON_PAGE_NUMBER) Integer rowsOnPageNumber,
            @RequestParam(value = "sortColumnIndex", required = false, defaultValue = DEFAULT_SORT_COLUMN_INDEX) Integer sortColumnIndex,
            Principal principal) {

         List<QuestionFrequentAskedDTO> questionFrequentAskedUserList = 
        		questionService.getQuestionsFrequentlyAskedForPageAndUser(
        				determineUserId(principal), 
        				rowsOnPageNumber, 
        				currentPageNumber, 
        				sortConfig(sortColumnIndex),
        				ascending(sortColumnIndex));

        return questionFrequentAskedUserList;
    }

    @RequestMapping(value = "/mybookmarks", method = RequestMethod.POST)
    public List<QuestionFrequentAskedDTO> getAllQuestionsBookmarked(
    	 @RequestParam(value = "currentPageNumber", required = false, defaultValue = DEFAULT_CURRENT_PAGE_NUMBER) Integer currentPageNumber,
         @RequestParam(value = "rowsOnPageNumber", required = false, defaultValue = DEFAULT_ROWS_ON_PAGE_NUMBER) Integer rowsOnPageNumber,
         @RequestParam(value = "sortColumnIndex", required = false, defaultValue = DEFAULT_SORT_COLUMN_INDEX) Integer sortColumnIndex,
         Principal principal) {
     
     List<QuestionFrequentAskedDTO> bookmarkedQuestionsList = 
     		questionService.getQuestionsBookmarked(
     				determineUserId(principal), 
     				rowsOnPageNumber, 
     				currentPageNumber, 
     				sortConfig(sortColumnIndex),
     				ascending(sortColumnIndex));

     return bookmarkedQuestionsList;
    }
    
    @RequestMapping(value = "/categories/{categoryId}", method = RequestMethod.POST)
    public List<QuestionFrequentAskedDTO> getAllQuestionsFilterCategory(
            @PathVariable Long categoryId,
            @RequestParam(value = "currentPageNumber", required = false, defaultValue = DEFAULT_CURRENT_PAGE_NUMBER) Integer currentPageNumber,
            @RequestParam(value = "rowsOnPageNumber", required = false, defaultValue = DEFAULT_ROWS_ON_PAGE_NUMBER) Integer rowsOnPageNumber,
            @RequestParam(value = "sortColumnIndex", required = false, defaultValue = DEFAULT_SORT_COLUMN_INDEX) Integer sortColumnIndex,
            Principal principal) {

        List<QuestionFrequentAskedDTO> questionFrequentAskedUserList = 
        		questionService.getQuestionsFrequentlyAskedForPageAndUser(
        				determineUserId(principal),
        				new Category(categoryId),
        				rowsOnPageNumber, 
        				currentPageNumber, 
        				sortConfig(sortColumnIndex),
        				ascending(sortColumnIndex));

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
            @RequestParam(value = "questionId", required = false) Long questionId) {

        if (questionId <= 0) {
            return false;
        }

        Rating rating = new Rating();
        rating.setUserId(determineUserId(principal));
        rating.setQuestion(questionService.getQuestionById(questionId));
        ratingService.save(rating);
        return true;
    }

    @RequestMapping(value = {"/bookmark", "/categories/{categoryId}/bookmark"}, method = RequestMethod.POST)
    public Boolean bookmarkQuestion(
            Principal principal,
            @RequestParam(value = "questionId", required = false) Long questionId) {

        if (questionId <= 0) {
            return false;
        }

        Bookmark bookmark = new Bookmark();
        bookmark.setUserId(determineUserId(principal));
        bookmark.setQuestionId(questionId);
        bookmarkService.save(bookmark);
        return true;
    }

    @RequestMapping(value = {"/unbookmark", "/categories/{categoryId}/unbookmark"}, method = RequestMethod.POST)
    public Boolean unbookmarkQuestion(
            Principal principal,
            @RequestParam(value = "questionId", required = false) Long questionId) {

         if (questionId <= 0) {
            return false;
        }

        bookmarkService.unbookmark(determineUserId(principal), questionId);
        return true;
    }


    @RequestMapping(value = "/metadata", method = RequestMethod.POST)
    public QuestionMetadata getMetadata(
            @RequestParam(value = "rowsOnPageNumber") Integer rowsOnPageNumber) {

        return new QuestionMetadata(
                questionService.getPagesCount(rowsOnPageNumber),
                questionService.getRecordsCount());
    }
    
    @RequestMapping(value = "/metadata/mybookmarks", method = RequestMethod.POST)
    public QuestionMetadata getMetadataBookmarks(
            @RequestParam(value = "rowsOnPageNumber") Integer rowsOnPageNumber, Principal principal) {

        return new QuestionMetadata(
                questionService.getPagesCountBookmarked(determineUserId(principal), rowsOnPageNumber),
                questionService.getRecordsCountBookmarked(determineUserId(principal)));
    }

    @RequestMapping(value = "/categories/{categoryId}/metadata", method = RequestMethod.POST)
    public QuestionMetadata getMetadataforCategory(
            @PathVariable Long categoryId,
            @RequestParam(value = "rowsOnPageNumber") Integer rowsOnPageNumber) {
        Category category = new Category(categoryId);
        return new QuestionMetadata(questionService.getPagesCount(category,
                rowsOnPageNumber), questionService.getRecordsCount(category));

    }
}