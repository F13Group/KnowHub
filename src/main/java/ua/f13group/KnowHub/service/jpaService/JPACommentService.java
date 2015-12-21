package ua.f13group.KnowHub.service.jpaService;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.f13group.KnowHub.domain.Comment;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.repository.CommentRepository;
import ua.f13group.KnowHub.service.CommentService;
import ua.f13group.KnowHub.web.dto.CommentDTO;

@Service("commentService")
public class JPACommentService implements CommentService {

	@Autowired 
	private CommentRepository commentRep; 
	
	@Override
	public Long saveComment(Comment comment) {		
		return commentRep.saveComment(comment);
	}

	@Override
	public List<CommentDTO> getAllQuestionCommentDTOs(Question question, User user) {
			List<CommentDTO> dtoList = new ArrayList<>();
			List<Comment> commentsList = commentRep.getAllQuestionComments(question);
			
			for (Comment i: commentsList) {
				List<User> negativeLikers = commentRep.getAllCommentConcreteLikers(i, false);
				List<User> positiveLikers = commentRep.getAllCommentConcreteLikers(i, true);
				
				CommentDTO tempDTO = new CommentDTO();
				tempDTO.setId(i.getId());
				tempDTO.setDate(i.getDate());
				tempDTO.setValue(i.getValue());
				tempDTO.setAuthorLogin(i.getUser().getLogin());
				tempDTO.setNegativeRate(negativeLikers.size());
				tempDTO.setPositiveRate(positiveLikers.size());
				
				tempDTO.setCurrentUserNegativelyRatedComment(false);
				tempDTO.setCurrentUserPositivelyRatedComment(false);
				
				if (user != null) {
					tempDTO.setCurrentUserNegativelyRatedComment(negativeLikers.contains(user));
					tempDTO.setCurrentUserPositivelyRatedComment(positiveLikers.contains(user));
				}

				dtoList.add(tempDTO);
			}
			
			return dtoList;
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

	@Override
	public CommentDTO getSingleCommentDTO(Long commentId, User user) {
		
		if (commentId != null) {
			Comment i = commentRep.getCommentById(commentId);
			
			List<User> negativeLikers = commentRep.getAllCommentConcreteLikers(i, false);
			List<User> positiveLikers = commentRep.getAllCommentConcreteLikers(i, true);
			
			CommentDTO tempDTO = new CommentDTO();
			tempDTO.setId(i.getId());
			tempDTO.setDate(i.getDate());
			tempDTO.setValue(i.getValue());
			tempDTO.setAuthorLogin(i.getUser().getLogin());
			tempDTO.setNegativeRate(negativeLikers.size());
			tempDTO.setPositiveRate(positiveLikers.size());
			
			if (user != null) {
				tempDTO.setCurrentUserNegativelyRatedComment(negativeLikers.contains(user));
				tempDTO.setCurrentUserPositivelyRatedComment(positiveLikers.contains(user));
			}
			else {
				tempDTO.setCurrentUserNegativelyRatedComment(false);
				tempDTO.setCurrentUserPositivelyRatedComment(false);
			}
			
			return tempDTO;
		}
		
		return null;
	}

//	@Override
//	public boolean isCommentRatedByTheUser(Comment comment, User user) {
//		return commentRep.isRatedByTheUser(comment, user);
//	}

}
