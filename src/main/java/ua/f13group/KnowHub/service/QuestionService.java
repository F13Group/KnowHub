package ua.f13group.KnowHub.service;

import java.util.List;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;

public interface QuestionService {
	public List<Question> findAll();

	public List<Question> findByCategory(Category category);

}