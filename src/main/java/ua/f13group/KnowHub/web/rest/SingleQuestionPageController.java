package ua.f13group.KnowHub.web.rest;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.service.BookmarkService;
import ua.f13group.KnowHub.service.QuestionService;
import ua.f13group.KnowHub.service.RatingService;
import ua.f13group.KnowHub.service.UserService;
import ua.f13group.KnowHub.web.dto.QuestionFrequentAskedDTO;

@RestController
@RequestMapping(value = "/question/{questionId}/info")
public class SingleQuestionPageController {

    @Autowired
    QuestionService questionService;
    
    @Autowired
    UserService userService;
    
    @Autowired
    RatingService ratingService;

    @Autowired
    BookmarkService bookmarkService;
	
	@RequestMapping(method = RequestMethod.GET)
	public QuestionFrequentAskedDTO getQuestionInfo(
			@PathVariable Long questionId,
			Principal principal) {
		
        Long userId = Long.valueOf(0);
        if (principal != null) {
            String login = principal.getName();
            userId = userService.getUserByLogin(login).getUserId();
        }

		Boolean isBookmarked = bookmarkService.isBookmarked(userId, questionId);
        Question curQuestion = questionService.getQuestionById(questionId);		
        Long rating = ratingService.countLikesByQuestionId(questionId);
        
		return new QuestionFrequentAskedDTO(
				curQuestion.getId(),
				curQuestion.getValue(),
				curQuestion.getLoadDate(),
				curQuestion.getCategory(),
				curQuestion.getTags(),
				rating,
				//ifLiked means wasAsked
				ratingService.ifLiked(userId, questionId),
				isBookmarked);		
	}
}
