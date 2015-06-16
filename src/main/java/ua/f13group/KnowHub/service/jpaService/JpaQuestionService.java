package ua.f13group.KnowHub.service.jpaService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.repository.QuestionRepository;
import ua.f13group.KnowHub.service.QuestionService;

public class JpaQuestionService implements QuestionService  {

	@Autowired 
	private QuestionRepository questionRep; 
	
	@Override
	public List<Question> findAll() {
		return questionRep.findAll();
	}

}
