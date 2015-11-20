package ua.f13group.KnowHub.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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
	
	@Override
	public List<Object[]> findForPageWithRatingIsAskedAndIsBookmarked(int userId, int rowsOnPage, int pageNumber,
			QuestionSortConfig orderBy, boolean ascending) {
		String sqlQueryString = "SELECT q.id, q.value, q.load_date, q.category_id, count (r.user_id) as rating,"
				+ " (SELECT count(r.id)>0 as asked FROM ratings r WHERE r.user_id = :userId and r.question_id = q.id),"
				+ " (SELECT count(b.id)>0 as bookmarked FROM bookmarks b WHERE b.user_id = :userId and b.question_id = q.id)"
				+ " FROM ratings r RIGHT JOIN questions q ON r.question_id = q.id"
				+ " GROUP BY q.id ORDER BY";
//		String sqlQueryString =  "SELECT q.id, q.value, q.loadDate, q.category, count (r.userId) as rating,"
//		+ " (SELECT count(r.id)>0 as asked FROM Rating r WHERE r.userId = :userId and r.question.id = q.id),"
//		+ " (SELECT count(b.id)>0 as bookmarked FROM Bookmark b WHERE b.userId = :userId and b.questionId = q.id)"
//		+ " FROM Rating r RIGHT JOIN r.question q GROUP BY q.id ORDER BY";
		if (orderBy == QuestionSortConfig.CATEGORY) {
			sqlQueryString += " q.category_id"; //or "q.category.value";
		} else {
			sqlQueryString += " q.value";
		}
		if (ascending) {
			sqlQueryString += " ASC";
		} else {
			sqlQueryString += " DESC";
		}
		Query query = 
				entityManager.createNativeQuery(sqlQueryString, "QuestionMapping");
		query.setParameter("userId", userId);
		List<Object[]> values = query.getResultList();
		return values;
	}
	
	@Override
	public List<Object[]> findForPageWithRatingIsAskedAndIsBookmarked(int userId, Category category, 
			int rowsOnPage, int pageNumber,
			QuestionSortConfig orderBy, boolean ascending) {
		String sqlQueryString = "SELECT q.id, q.value, q.load_date, q.category_id, count (r.user_id) as rating,"
				+ " (SELECT count(r.id)>0 as asked FROM ratings r WHERE r.user_id = :userId and r.question_id = q.id),"
				+ " (SELECT count(b.id)>0 as bookmarked FROM bookmarks b WHERE b.user_id = :userId and b.question_id = q.id)"
				+ " FROM ratings r RIGHT JOIN questions q ON r.question_id = q.id WHERE q.category_id = :categoryId"
				+ " GROUP BY q.id ORDER BY";
//		String sqlQueryString =  "SELECT q.id, q.value, q.loadDate, q.category, count (r.userId) as rating,"
//		+ " (SELECT count(r.id)>0 as asked FROM Rating r WHERE r.userId = :userId and r.question.id = q.id),"
//		+ " (SELECT count(b.id)>0 as bookmarked FROM Bookmark b WHERE b.userId = :userId and b.questionId = q.id)"
//		+ " FROM Rating r RIGHT JOIN r.question q WHERE q.category.id =:categoryId"
//		+ " GROUP BY q.id ORDER BY";
		if (orderBy == QuestionSortConfig.CATEGORY) {
			sqlQueryString += " q.category_id"; //or "q.category.value";
		} else {
			sqlQueryString += " q.value";
		}
		if (ascending) {
			sqlQueryString += " ASC";
		} else {
			sqlQueryString += " DESC";
		}
		Query query = 
				entityManager.createNativeQuery(sqlQueryString, "QuestionMapping");
		query.setParameter("userId", userId);
		query.setParameter("categoryId", category.getId());
		List<Object[]> values = query.getResultList();
		return values;
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
