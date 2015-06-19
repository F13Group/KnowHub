package ua.f13group.KnowHub.service.jpaService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.repository.QuestionRepository;
import ua.f13group.KnowHub.service.QuestionService;

@Service(value= "questionService")
public class JpaQuestionService implements QuestionService  {

	@Autowired 
	private QuestionRepository questionRep; 
	
	@Override
	public List<Question> findAll() {
		return questionRep.findAll();
	}

	@Override
	public List<Question> findByCategory(Category category) {
		
		return questionRep.findByCategory(category);	
	}

}
