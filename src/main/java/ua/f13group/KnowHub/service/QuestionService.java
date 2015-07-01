package ua.f13group.KnowHub.service;

import java.util.List;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;

public interface QuestionService {
	public List<Question> findAll();

	public List<Question> findByCategory(Category category);
	
	public List<Question> getQuestionsForPage(int rowsOnPage, int pageNumber);
	public List<Question> getQuestionsForPage(Category category, int rowsOnPage, int pageNumber);
	public int getPagesCount(Category category, int rowsOnPage);
	public int getPagesCount(int rowsOnPage);
	public int getRecordsCount();
	public int getRecordsCount(Category category);	

}