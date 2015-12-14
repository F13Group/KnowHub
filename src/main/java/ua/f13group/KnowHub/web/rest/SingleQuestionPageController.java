package ua.f13group.KnowHub.web.rest;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.service.BookmarkService;
import ua.f13group.KnowHub.service.QuestionService;
import ua.f13group.KnowHub.service.RatingService;
import ua.f13group.KnowHub.service.UserService;
import ua.f13group.KnowHub.web.dto.QuestionFrequentAskedDTO;

@RestController
@RequestMapping(value = "/question")
public class SingleQuestionPageController {

	@Autowired
	QuestionService questionService;

	@Autowired
	UserService userService;

	@Autowired
	RatingService ratingService;

	@Autowired
	BookmarkService bookmarkService;

	@RequestMapping(value = "/{questionId}/info", method = RequestMethod.GET)
	public QuestionFrequentAskedDTO getQuestionInfo(@PathVariable Long questionId, Principal principal) {

		Long userId = Long.valueOf(0);
		if (principal != null) {
			String login = principal.getName();
			userId = userService.getUserByLogin(login).getUserId();
		}

		Boolean isBookmarked = bookmarkService.isBookmarked(userId, questionId);
		Question curQuestion = questionService.getQuestionById(questionId);
		Long rating = ratingService.countLikesByQuestionId(questionId);

		return new QuestionFrequentAskedDTO(curQuestion.getId(), curQuestion.getValue(), curQuestion.getLoadDate(),
				curQuestion.getCategory(), curQuestion.getTags(), rating,
				// ifLiked means wasAsked
				ratingService.ifLiked(userId, questionId), isBookmarked, curQuestion.getUser(), curQuestion.getViews(),
				curQuestion.getDescription());
	}

	@RequestMapping(value = "/{questionId}/comments", method = RequestMethod.GET)
	public List<CommentStub> getComments(@PathVariable Long questionId,
			@RequestParam(value = "startPoint", required = false, defaultValue = "0") Integer startPoint,
			@RequestParam(value = "commentsQuantity", required = false, defaultValue = "5") Integer commentsQuantity) {
		List<CommentStub> commentStubs = new ArrayList<>(19);
		for (int i = 0; i < 19; i++) {
			commentStubs.add(new CommentStub(startPoint, commentsQuantity));
		}
		int commentsToLoad = (startPoint + commentsQuantity) > 19 ? 19 : (startPoint + commentsQuantity);
		return new ArrayList<>(commentStubs.subList(startPoint, commentsToLoad));
	}

	private class CommentStub {
		private String author;
		private String value;
		private Date date;
		private Integer startPoint;
		private Integer commentsQuantity;

		public CommentStub(Integer startPoint, Integer commentsQuantity) {
			super();
			this.author = "Cat Ipsum";
			this.value = "Cat ipsum dolor sit amet, make meme, make cute face yet scratch the furniture or eat and than sleep on your face. Chew iPad power cord chase laser love to play with owner's hair tie, and claws in your leg so intently stare at the same spot, for use lap as chair. Scream at teh bath the dog smells bad shake treat bag, yet my left donut is missing, as is my right. Meow stare at wall turn and meow stare at wall some more meow again continue staring so put toy mouse in food bowl run out of litter box at full speed yet intently sniff hand. Loves cheeseburgers stretch, for climb a tree, wait for a fireman jump to fireman then scratch his face. Sleep on keyboard. Brown cats with pink ears spot something, big eyes, big eyes, crouch, shake butt, prepare to pounce roll on the floor purring your whiskers off, hiss at vacuum cleaner for present belly, scratch hand when stroked kitty power! ";
			this.date = new Date();
			this.startPoint = startPoint;
			this.commentsQuantity = commentsQuantity;
		}

		public String getAuthor() {
			return author;
		}

		public void setAuthor(String author) {
			this.author = author;
		}

		public String getValue() {
			return value;
		}

		public void setValue(String value) {
			this.value = value;
		}

		public Date getDate() {
			return date;
		}

		public void setDate(Date date) {
			this.date = date;
		}

		public Integer getCommentsQuantity() {
			return commentsQuantity;
		}

		public Integer getStartPoint() {
			return startPoint;
		}

		public void setCommentsQuantity(Integer commentsQuantity) {
			this.commentsQuantity = commentsQuantity;
		}

		public void setStartPoint(Integer startPoint) {
			this.startPoint = startPoint;
		}
	}
}
