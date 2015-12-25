
package ua.f13group.KnowHub.web.rest;

import java.beans.Transient;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ua.f13group.KnowHub.domain.Comment;
import ua.f13group.KnowHub.domain.Like;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.service.BookmarkService;
import ua.f13group.KnowHub.service.CommentService;
import ua.f13group.KnowHub.service.LikeService;
import ua.f13group.KnowHub.service.QuestionService;
import ua.f13group.KnowHub.service.RatingService;
import ua.f13group.KnowHub.service.UserService;
import ua.f13group.KnowHub.web.dto.CommentDTO;
//import ua.f13group.KnowHub.web.dto.CommentDTO;
import ua.f13group.KnowHub.web.dto.QuestionFrequentAskedDTO;

@RestController
@RequestMapping(value = "/question/{questionId}")
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
    CommentService commentService;
    
    @Autowired
    LikeService likeService;
	
	@RequestMapping(value="/info", method = RequestMethod.GET)
	public QuestionFrequentAskedDTO getQuestionInfo(
			@PathVariable("questionId") Long questionId,
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
	
	@RequestMapping(value = "/comments", method = RequestMethod.POST)
	public boolean addComments(@PathVariable("questionId") Long questionId,
			Principal principal,
			@RequestParam(value = "text") String commentText) {
		
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
            
            commentService.saveComment(curComment);
            
            return true;
        }
		
		return false;
	}
	
	
	//Method for Ajax uploading comments list, will be implement in next sprints)
	@RequestMapping(value = "/comments", method = RequestMethod.GET)
	public List<CommentDTO> getComment(@PathVariable Long questionId,
            @RequestParam(value = "numberOfComments", required = false) Integer offset,
            @RequestParam(value = "lastCommentId", required = false) Long commentId, Principal principal) {
 
		Question curQuestion = questionService.getQuestionById(questionId);
        User curUser = null;
        if (principal != null) {
            curUser = userService.getUserByLogin(principal.getName());
        }

		return commentService.getAllQuestionCommentDTOs(curQuestion, curUser);
		
//		Question curQuestion = questionService.getQuestionById(questionId);
//		Comment curComment = commentServive.getCommentById(commentId);
//		return commentServive.getFixedNumberOfComments(curQuestion, curComment, offset);
	}
	
/*	@RequestMapping(value = "/comments", method = RequestMethod.GET)
	public List<CommentDTO> getAllComment(@PathVariable("questionId") Long questionId,
			Principal principal) {
		
		Question curQuestion = questionService.getQuestionById(questionId);
		User curUser = null;
		if (principal != null) {
			curUser = userService.getUserByLogin(principal.getName());
		}
		
		return commentService.getAllQuestionCommentDTOs(curQuestion, curUser);
	}*/
	
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	@Transactional
	public boolean changeCommentLike(@PathVariable Long questionId,
			Principal principal,
			@RequestParam(value = "commentId") Long commentId,
			@RequestParam(value = "isPositiveLike") Boolean typeOfRate) {

        Like oldLike;

        if (principal != null) {
            Long id = likeService.getLikeIdByUserIdAndCommentId(userService.getUserByLogin(principal.getName()).getUserId(), commentId);
            if (id == null) {
                Like curLike = new Like();
                curLike.setUser(userService.getUserByLogin(principal.getName()));
                curLike.setPositive(typeOfRate);
                curLike.setComment(commentService.getCommentById(commentId));
                likeService.addLike(curLike);

            } else if (likeService.getLikeById(id).isPositive()!=typeOfRate) {
                oldLike = likeService.getLikeById(id);
                oldLike.setPositive(typeOfRate);
                likeService.addLike(oldLike);
                return true;
            }
			
//		if ((oldLike == null || oldLike.isPositive() != typeOfRate)) {
//			Like curLike = new Like();
//			curLike.setUser(userService.getUserByLogin(principal.getName()));
//			curLike.setPositive(typeOfRate);
//			curLike.setComment(commentService.getCommentById(commentId));			
//			likeService.addLike(curLike);			
//			return true;
//		}
		
            return false;

        }


        return false;
    }
	
	@RequestMapping(value = "/unlike", method = RequestMethod.POST)
	public boolean changeCommentLike(Principal principal,
			@RequestParam(value = "likeId") Long likeId) {
			
		if (principal != null) {
			
			likeService.removeLike(likeService.getLikeById(likeId));
			
			return true;
		}
		
		return false;
	}
	
	@RequestMapping(value = "/comments/{commentId}", method = RequestMethod.GET)
	public CommentDTO getSingleComment(@PathVariable("commentId") Long commentId,
			Principal principal){
		
		User curUser = null;
		if (principal != null) {
			curUser = userService.getUserByLogin(principal.getName());
		}
		
		return commentService.getSingleCommentDTO(commentId, curUser);
		
	}
	
}

