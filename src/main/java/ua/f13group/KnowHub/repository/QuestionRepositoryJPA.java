package ua.f13group.KnowHub.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.QuestionSortConfig;

@Repository("questionRepository")
public class QuestionRepositoryJPA implements QuestionRepository {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Question> findForPage(int rowsOnPage, int pageNumber,
			QuestionSortConfig orderBy, boolean ascending) {
		// TypedQuery<Question> query =
		// entityManager.createNamedQuery("Question.findAll", Question.class);
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Question> criteriaQuery = criteriaBuilder
				.createQuery(Question.class);

		Root<Question> questions = criteriaQuery.from(Question.class);
		Join<Question, Category> categories = questions
				.join("category");
		if (ascending == true){
			if(orderBy==QuestionSortConfig.CATEGORY){
				criteriaQuery.orderBy(criteriaBuilder.asc(categories
						.get(orderBy.dbName)));
			}
			else{
			criteriaQuery.orderBy(criteriaBuilder.asc(questions
					.get(orderBy.dbName)));
			}
		}
		else{
			if(orderBy==QuestionSortConfig.CATEGORY){
				criteriaQuery.orderBy(criteriaBuilder.desc(categories
						.get(orderBy.dbName)));
			}
			else{
			criteriaQuery.orderBy(criteriaBuilder.desc(questions
					.get(orderBy.dbName)));
			}
		}

		TypedQuery<Question> query = entityManager.createQuery(criteriaQuery);
		query.setFirstResult(((pageNumber - 1) * rowsOnPage));
		query.setMaxResults(rowsOnPage);

		return query.getResultList();
	}

	@Override
	public List<Question> findForPage(Category category, int rowsOnPage,
			int pageNumber, QuestionSortConfig orderBy, boolean ascending) {
		// TypedQuery<Question> query =
		// entityManager.createNamedQuery("Question.findByCategory",
		// Question.class);
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		CriteriaQuery<Question> criteriaQuery = criteriaBuilder
				.createQuery(Question.class);

		Root<Question> questions = criteriaQuery.from(Question.class);
		if (ascending == true)
			criteriaQuery.where(
					criteriaBuilder.equal(questions.get("category"),
							criteriaBuilder.parameter(Category.class,
									"category"))).orderBy(
					criteriaBuilder.asc(questions.get(orderBy.dbName)));
		else
			criteriaQuery.where(
					criteriaBuilder.equal(questions.get("category"),
							criteriaBuilder.parameter(Category.class,
									"category"))).orderBy(
					criteriaBuilder.desc(questions.get(orderBy.dbName)));

		TypedQuery<Question> query = entityManager.createQuery(criteriaQuery);
		query.setParameter("category", category);
		query.setFirstResult(((pageNumber - 1) * rowsOnPage));
		query.setMaxResults(rowsOnPage);

		return query.getResultList();
	}

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
	public Question findById(Long questionId) {
		return entityManager.find(Question.class, questionId);
	}

}
/**
 * Deleted queries
 */

/*
 * @Override public List<Question> findAll() { // TypedQuery<Question> query =
 * entityManager.createNamedQuery("Question.findAll", Question.class);
 * 
 * return query.getResultList(); }
 */
/*
 * @Override public List<Question> findByCategory(Category category) { //
 * TypedQuery<Question> query =
 * entityManager.createNamedQuery("Question.findByCategory", Question.class);
 * CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
 * CriteriaQuery<Question> criteriaQuery =
 * criteriaBuilder.createQuery(Question.class); Root<Question> questions =
 * criteriaQuery.from(Question.class);
 * criteriaQuery.where(criteriaBuilder.equal(questions.get("category"),
 * criteriaBuilder.parameter(Category.class,"category")));
 * 
 * 
 * TypedQuery<Question> query = entityManager.createQuery(criteriaQuery);
 * query.setParameter("category", category);
 * 
 * return query.getResultList(); }
 */

/*
 * @Override public List<Question> findByCategory(Category
 * category,QuestionSortConfig orderBy) { // TypedQuery<Question> query =
 * entityManager.createNamedQuery("Question.findByCategory", Question.class);
 * CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
 * CriteriaQuery<Question> criteriaQuery =
 * criteriaBuilder.createQuery(Question.class); Root<Question> questions =
 * criteriaQuery.from(Question.class);
 * criteriaQuery.where(criteriaBuilder.equal(questions.get("category"),
 * criteriaBuilder.parameter(Category.class,"category")))
 * .orderBy(criteriaBuilder.asc(questions.get(orderBy.dbName)));
 * 
 * TypedQuery<Question> query = entityManager.createQuery(criteriaQuery);
 * query.setParameter("category", category);
 * 
 * return query.getResultList(); }
 */

/*
 * @Override public List<Question> findForPage(int rowsOnPage, int pageNumber) {
 * // TypedQuery<Question> query =
 * entityManager.createNamedQuery("Question.findAll", Question.class);
 * CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
 * CriteriaQuery<Question> criteriaQuery =
 * criteriaBuilder.createQuery(Question.class);
 * 
 * Root<Question> questions = criteriaQuery.from(Question.class);
 * TypedQuery<Question> query = entityManager.createQuery(criteriaQuery);
 * 
 * query.setFirstResult(((pageNumber-1) * rowsOnPage));
 * query.setMaxResults(rowsOnPage);
 * 
 * return query.getResultList(); }
 */
