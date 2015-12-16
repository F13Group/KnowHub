package ua.f13group.KnowHub.service;

import java.util.List;

import ua.f13group.KnowHub.domain.Comment;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.web.dto.CommentDTO;

public interface CommentService {
	public Long saveComment(Comment comment);
	public List<CommentDTO> getAllQuestionCommentDTOs(Question question, User user);
	public List<Comment> getAllUserComments(User user);
	public List<Comment> getFixedNumberOfComments(Question question, Comment comment, int offset);
	public Comment getCommentById(Long commentId);
//	public boolean isCommentRatedByTheUser(Comment comment, User user);
}
