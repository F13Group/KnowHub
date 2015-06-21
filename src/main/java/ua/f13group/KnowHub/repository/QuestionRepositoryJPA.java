
package ua.f13group.KnowHub.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;

@Repository("questionRepository")
public class QuestionRepositoryJPA implements QuestionRepository {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<Question> findAll() {
		TypedQuery<Question> query = entityManager.createNamedQuery("Question.findAll", Question.class);
		return query.getResultList();
	}

	@Override
	public List<Question> findByCategory(Category category) {
		TypedQuery<Question> query = entityManager.createNamedQuery("Question.findByCategory", Question.class);
		query.setParameter("category", category.getId());
		return query.getResultList();
	}

/*	@Override
	public List<Question> getPage(int pageNumber) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getPagesCount() {
		 TypedQuery<Long> query = entityManager.createNamedQuery("Question.getPagesCount", Long.class);
		return 0;
	}*/

}
