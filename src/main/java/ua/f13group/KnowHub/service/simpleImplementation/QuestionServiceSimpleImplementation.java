package ua.f13group.KnowHub.service.simpleImplementation;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.service.QuestionService;

@Service
public class QuestionServiceSimpleImplementation implements QuestionService {

	@Override
	public List<Question> findAll() {
		ArrayList<Question> mock = new ArrayList<Question>();
		Question q1 = new Question();
		q1.setId(1l);
		q1.setPostId(1l);
		q1.setRating(100l);
		q1.setValue("Question 1");
		
		Question q2 = new Question();
		q2.setId(2l);
		q2.setPostId(2l);
		q2.setRating(200l);
		q2.setValue("Question 2");
		
		mock.add(q1);
		mock.add(q2);
		
		return mock;
	}

}
