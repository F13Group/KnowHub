package ua.f13group.KnowHub.service;

import java.util.List;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.QuestionSortConfig;
import ua.f13group.KnowHub.web.dto.QuestionFrequentAskedDTO;

public interface QuestionService {
	
	public int getPagesCount(Category category, int rowsOnPage);
	public int getPagesCount(int rowsOnPage);
	public int getRecordsCount();
	public int getRecordsCount(Category category);
	public Question getQuestionById(Long questionId);
	
	public List<QuestionFrequentAskedDTO> getQuestionsFrequentlyAskedForPageAndUser(
			long userId, int rowsOnPage, int pageNumber, QuestionSortConfig cfg,
			boolean ascending);
	
	public List<QuestionFrequentAskedDTO> getQuestionsFrequentlyAskedForPageAndUser(
			long userId, Category category, int rowsOnPage, int pageNumber, QuestionSortConfig cfg,
			boolean ascending);

	public Long save(Question question);
	public void addView(Long questionId);
	
	public int getPagesCountBookmarked(Long userId, Integer rowsOnPageNumber);
	public int getRecordsCountBookmarked(Long userId);
	public List<QuestionFrequentAskedDTO> getQuestionsBookmarked(Long userId, Integer rowsOnPageNumber,
			Integer currentPageNumber, QuestionSortConfig sortConfig, boolean ascending);

}