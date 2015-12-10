package ua.f13group.KnowHub.service.jpaService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import ua.f13group.KnowHub.domain.Comment;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.repository.CommentRepository;
import ua.f13group.KnowHub.service.CommentService;

public class JPACommentService implements CommentService {

	@Autowired 
	private CommentRepository commentRep; 
	
	@Override
	public Long saveComment(Comment comment) {		
		return commentRep.saveComment(comment);
	}

	@Override
	public List<Comment> getAllQuestionComments(Question question) {
		return commentRep.getAllQuestionComments(question);
	}

	@Override
	public List<Comment> getAllUserComments(User user) {
		return commentRep.getAllAuthorComments(user);
	}

	@Override
	public List<Comment> getFixedNumberOfComments(Question question, Comment comment, int offset) {
		return commentRep.getNextCommentsForScrolling(question, comment, offset);
	}

	@Override
	public Comment getCommentById(Long commentId) {
		return commentRep.getCommentById(commentId);
	}

}
