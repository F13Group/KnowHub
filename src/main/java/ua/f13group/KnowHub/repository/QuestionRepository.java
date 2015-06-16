package ua.f13group.KnowHub.repository;

import java.util.List;

import ua.f13group.KnowHub.domain.*;

public interface QuestionRepository {
	public List<Question> findAll();
}
