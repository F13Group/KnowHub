package ua.f13group.KnowHub.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.QuestionSortConfig;
import ua.f13group.KnowHub.domain.User;

@Repository("questionRepository")
public class QuestionRepositoryJPA implements QuestionRepository {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public int getRecordsCount(Category category) {
		TypedQuery<Long> query = entityManager.createNamedQuery(
				"Question.getPagesCountWithCategory", Long.class);
		query.setParameter("category", category.getId());

		return query.getSingleResult().intValue();
	}

	@Override
	public int getRecordsCount() {
		TypedQuery<Long> query = entityManager.createNamedQuery(
				"Question.getPagesCount", Long.class);

		return query.getSingleResult().intValue();
	}

	@Override
	public int getRecordsCountBookmarked(Long userId) {
		TypedQuery<Long> query = entityManager.createNamedQuery(
				"Bookmark.getPagesCountBookmarked", Long.class);
		query.setParameter("userId", userId);
		
		return query.getSingleResult().intValue();
	}
	
	@Override
	public Question findById(Long questionId) {
		return entityManager.find(Question.class, questionId);
	}
	
	@Override
	public List<Object[]> findForPageWithRatingIsAskedAndIsBookmarked(long userId,
			Category category, 
			int rowsOnPage,
			int pageNumber,
			QuestionSortConfig orderBy,
			boolean isSortedAscending) {

		Query query = 
				entityManager.createNativeQuery(
						Question.getFindAllWithRatingIsAskedAndIsBookmarkedQueryString(category, orderBy, isSortedAscending), "QuestionMapping");
		
		query.setParameter("userId", userId);
		if (category != null) {
			query.setParameter("categoryId", category.getId());
		}
		
		query.setFirstResult(((pageNumber - 1) * rowsOnPage));
		query.setMaxResults(rowsOnPage);
		
		List<Object[]> values = query.getResultList();		
		return values;
	}

    @Override
    @Transactional
    public Long save(Question question) {
        if (question.getId() != null) {
            entityManager.merge(question);
        } else {
            entityManager.persist(question);
        }
        return question.getId();
    }

	@Override
	public List<Object[]> findBookmarkedByUser(User user) {
		Query query = entityManager.createNativeQuery("Question.findByUserBookmarkedOnly", Long.class);
		query.setParameter("user_id", user.getUserId());
		List<Object[]> result = query.getResultList();
		return result;
	}
	
	@Override
	public List<Object[]> findBookmarkedByUserPaginatedAndOrdered(long userId,
			int rowsOnPage,
			int pageNumber,
			QuestionSortConfig orderBy,
			boolean isSortedAscending) {

		Query query = 
				entityManager.createNativeQuery(
						Question.getBookmarkedByUserPaginatedAndOrdered(orderBy, isSortedAscending), "QuestionMapping");
		
		query.setParameter("userId", userId);
		
		query.setFirstResult(((pageNumber - 1) * rowsOnPage));
		query.setMaxResults(rowsOnPage);
		
		List<Object[]> values = query.getResultList();
		return values;
	}
}