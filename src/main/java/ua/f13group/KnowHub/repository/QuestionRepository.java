package ua.f13group.KnowHub.repository;

import java.util.List;

import ua.f13group.KnowHub.domain.*;

public interface QuestionRepository {

	// public List<Question> findAll();
	// public List<Question> findByCategory(Category category,
	// QuestionSortConfig cfg);
	//
	// for pagination
	public List<Question> findForPage(int rowsOnPage, int pageNumber,
			QuestionSortConfig orderBy, boolean ascending);

	public List<Question> findForPage(Category category, int rowsOnPage,
			int pageNumber, QuestionSortConfig orderBy, boolean ascending);

	public int getRecordsCount(Category category);

	public int getRecordsCount();
	// public List<Question> testCriteria(int rowsOnPage, int
	// pageNumber,QuestionSortConfig cfg);

	public Question findById(Long questionId);

	List<Object[]> findForPageWithRatingIsAskedAndIsBookmarked(long userId,
			int rowsOnPage, int pageNumber, QuestionSortConfig orderBy,
			boolean ascending);
	
	List<Object[]> findForPageWithRatingIsAskedAndIsBookmarked(
			long userId, Category category, int rowsOnPage, int pageNumber,
			QuestionSortConfig orderBy, boolean ascending);

	public Long save(Question question);

	public List<Object[]> findBookmarkedByUser(User user);

	int getRecordsCountBookmarked(Long userId);
}
