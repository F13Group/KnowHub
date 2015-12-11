package ua.f13group.KnowHub.repository;

import java.util.List;

import ua.f13group.KnowHub.domain.*;

public interface QuestionRepository {

	public int getRecordsCount(Category category);

	public int getRecordsCount();

	public Question findById(Long questionId);

	List<Object[]> findForPageWithRatingIsAskedAndIsBookmarked(
			long userId, Category category, int rowsOnPage, int pageNumber,
			QuestionSortConfig orderBy, boolean ascending);

	public Long save(Question question);

	public List<Object[]> findBookmarkedByUser(User user);

	int getRecordsCountBookmarked(Long userId);

	List<Object[]> findBookmarkedByUserPaginatedAndOrdered(long userId, int rowsOnPage, int pageNumber,
			QuestionSortConfig orderBy, boolean isSortedAscending);
}
