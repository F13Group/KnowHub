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

	@Override
	public List<Question> getQuestionsForPage(int rowsOnPage, int pageNumber) {
		
		return questionRep.getQuestionsForPage(rowsOnPage, pageNumber);
	}

	@Override
	public List<Question> getQuestionsForPage(Category category, int rowsOnPage, int pageNumber) {
		
		return questionRep.getQuestionsForPage(category, rowsOnPage, pageNumber);
	}

	@Override
	public int getPagesCount( Category category, int rowsOnPage) {
		int  result = questionRep.getRecordsCount(category);
		if (result % rowsOnPage ==0) 
			return result/rowsOnPage;
		else
			return result/rowsOnPage+1;
	}
	
	@Override
	public int getPagesCount(int rowsOnPage) {
		int  result =  questionRep.getRecordsCount();
		if (result % rowsOnPage ==0) 
			return result/rowsOnPage;
		else
			return result/rowsOnPage+1;
	}

	@Override
	public int getRecordsCount() {
		return questionRep.getRecordsCount();
	}

	@Override
	public int getRecordsCount(Category category) {
		return questionRep.getRecordsCount(category);
	}

}
