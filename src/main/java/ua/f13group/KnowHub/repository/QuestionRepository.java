package ua.f13group.KnowHub.repository;

import java.util.List;

import ua.f13group.KnowHub.domain.*;

public interface QuestionRepository {
	public List<Question> findAll();
	public List<Question> findByCategory(Category category);
	
	//for pagination
	public List<Question> getQuestionsForPage(int rowsOnPage, int pageNumber);
	public List<Question> getQuestionsForPage(Category category, int rowsOnPage, int pageNumber);
	public int getRecordsCount(Category category);
	public int getRecordsCount();
	public List<Question> testCriteria(int rowsOnPage, int pageNumber,QuestionSortConfig cfg);
	
}
