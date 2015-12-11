package ua.f13group.KnowHub.repository;

import java.util.List;

import ua.f13group.KnowHub.domain.Comment;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.User;

public interface CommentRepository {
	public Long saveComment(Comment comment);
	public List<Comment> getAllQuestionComments(Question question);
	public List<Comment> getAllAuthorComments(User user);
	public List<Comment> getNextCommentsForScrolling(Question question, Comment comment, int offset);
	public Comment getCommentById(Long commentId);	
	public boolean isRatedByTheUser(Comment comment, User user);
}
