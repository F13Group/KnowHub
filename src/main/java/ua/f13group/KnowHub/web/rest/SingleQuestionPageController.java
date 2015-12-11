
package ua.f13group.KnowHub.web.rest;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ua.f13group.KnowHub.domain.Comment;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.service.BookmarkService;
import ua.f13group.KnowHub.service.CommentService;
import ua.f13group.KnowHub.service.QuestionService;
import ua.f13group.KnowHub.service.RatingService;
import ua.f13group.KnowHub.service.UserService;
//import ua.f13group.KnowHub.web.dto.CommentDTO;
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
    
    @Autowired
    CommentService commentServive;
	
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
				isBookmarked,
				curQuestion.getUser(),
				curQuestion.getViews(),
				curQuestion.getDescription());		
	}
	
	@RequestMapping(value = "/newcomment", method = RequestMethod.POST)
	public boolean addComments(@PathVariable Long questionId,
			Principal principal,
			@RequestParam(value = "commentText") String commentText) {
		
		if (principal != null) {
			
            User curUser = userService.getUserByLogin(principal.getName());           
            Question curQuestion = questionService.getQuestionById(questionId);	
            Date curDate = new Date();
            
            Comment curComment = new Comment();
            curComment.setUser(curUser);
            curComment.setDate(curDate);
            curComment.setValue(commentText);
            curComment.setQuestion(curQuestion);
            curComment.setRating(0);
            
            commentServive.saveComment(curComment);
            
            return true;
        }
		
		return false;
	}
	
	@RequestMapping(value = "/comments", method = RequestMethod.GET)
	public List<Comment> getComment(@PathVariable Long questionId
 //          , @RequestParam(value = "numberOfComments") Integer offset,
//            @RequestParam(value = "lastCommentId") Long commentId
            ) {
		
		Question curQuestion = questionService.getQuestionById(questionId);
//		Comment curComment = commentServive.getCommentById(commentId);
		return commentServive.getAllQuestionComments(curQuestion);
		//return commentServive.getFixedNumberOfComments(curQuestion, curComment, offset);
	}
	
}

