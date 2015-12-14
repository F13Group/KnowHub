package ua.f13group.KnowHub.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import ua.f13group.KnowHub.domain.Comment;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.User;

@Repository("commentRepository")
public class CommentRepositoryJPA implements CommentRepository{
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public Long saveComment(Comment comment) {		
        if (comment.getId() != null) {
            entityManager.merge(comment);
        } else {
            entityManager.persist(comment);
        }
		return comment.getId();
	}
	
	@Override
	public List<Comment> getAllQuestionComments(Question question) {
		TypedQuery<Comment> query = entityManager.createNamedQuery(
				"Comment.getAllQuestionComments", Comment.class);
		query.setParameter("questionId", question.getId());		
		return query.getResultList();
	}

	@Override
	public List<Comment> getAllAuthorComments(User user) {
		TypedQuery<Comment> query = entityManager.createNamedQuery(
				"Comment.getAllAuthorsComments", Comment.class);
		query.setParameter("userId", user.getUserId());		
		return query.getResultList();
	}

	@Override
	public List<Comment> getNextCommentsForScrolling(Question question, Comment comment, int offset) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Comment getCommentById(Long commentId) {
		return entityManager.find(Comment.class, commentId);
	}

	@Override
	public boolean isRatedByTheUser(Comment comment, User user) {
		TypedQuery<User> query = entityManager.createNamedQuery(
				"Comment.getAllCommentLikers", User.class);
		query.setParameter("commentId", comment.getId());	
		List<User> likers = query.getResultList();
		
		return likers.contains(user);
	}

}
