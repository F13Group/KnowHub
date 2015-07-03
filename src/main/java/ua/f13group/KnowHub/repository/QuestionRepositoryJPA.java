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
		query.setParameter("category", category);
		
		return query.getResultList();
	}

	@Override
	public List<Question> getQuestionsForPage(int rowsOnPage, int pageNumber) {
		TypedQuery<Question> query = entityManager.createNamedQuery("Question.findAll", Question.class);
		
		query.setFirstResult(((pageNumber-1) * rowsOnPage));
        query.setMaxResults(rowsOnPage);
        
		return  query.getResultList();
	}

	@Override
	public List<Question> getQuestionsForPage(Category category, int rowsOnPage, int pageNumber) {
		TypedQuery<Question> query = entityManager.createNamedQuery("Question.findByCategory", Question.class);
		query.setParameter("category", category.getId());
		
		query.setFirstResult(((pageNumber-1) * rowsOnPage));
        query.setMaxResults(rowsOnPage);
		
		return  query.getResultList();
	}

	@Override
	public int getRecordsCount( Category category) {
		TypedQuery<Long> query = entityManager.createNamedQuery("Question.getPagesCountWithCategory", Long.class);
		query.setParameter("category", category.getId());
		
		return query.getSingleResult().intValue();
	}
	
	@Override
	public int getRecordsCount() {
		TypedQuery<Long> query = entityManager.createNamedQuery("Question.getPagesCount", Long.class);
		
		return query.getSingleResult().intValue();
	}


}
