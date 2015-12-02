package ua.f13group.KnowHub.service.jpaService;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;
import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.QuestionSortConfig;
import ua.f13group.KnowHub.domain.Tag;
import ua.f13group.KnowHub.repository.QuestionRepository;
import ua.f13group.KnowHub.repository.UserRepository;
import ua.f13group.KnowHub.service.QuestionService;
import ua.f13group.KnowHub.web.dto.QuestionFrequentAskedDTO;

@Service(value= "questionService")
public class JpaQuestionService implements QuestionService  {

	@Autowired 
	private QuestionRepository questionRep;
	
	@Autowired
	private UserRepository userRep;
	
	@Override
	public List<Question> getQuestionsForPage(int rowsOnPage, int pageNumber,QuestionSortConfig cfg, boolean ascending) {
		
		return questionRep.findForPage(rowsOnPage, pageNumber, cfg, ascending);
	}

	@Override
	public List<Question> getQuestionsForPage(Category category, int rowsOnPage, int pageNumber, QuestionSortConfig cfg, boolean ascending) {
		
		return questionRep.findForPage(category,rowsOnPage, pageNumber, cfg, ascending);
	}
	
	@Override
	public List<QuestionFrequentAskedDTO> getQuestionsFrequentlyAskedForPageAndUser
		(long userId, int rowsOnPage, int pageNumber, QuestionSortConfig cfg, boolean ascending) {
		
		List<Object[]> queryResult = 
				questionRep.findForPageWithRatingIsAskedAndIsBookmarked(userId, 
						rowsOnPage, pageNumber, cfg, ascending);
		
		List<QuestionFrequentAskedDTO> result = new LinkedList<QuestionFrequentAskedDTO>();
		
		for (Object[] row : queryResult) {
			Question q = (Question) row[0];
			BigInteger rating = (BigInteger) row[1];
			Boolean isAsked = (Boolean) row[2];
			Boolean isBookmarked = (Boolean) row[3];
			result.add(new QuestionFrequentAskedDTO(
					q.getId(),
					q.getValue(),
					q.getLoadDate(),
					q.getCategory(),
					q.getTags(),
					rating.longValue(),
					isAsked,
					isBookmarked,
					q.getUser(),
					q.getViews(),
					q.getDescription()));
		}
		
		return result;
	}
	
	@Override
	public List<QuestionFrequentAskedDTO> getQuestionsFrequentlyAskedForPageAndUser(
			long userId, Category category, int rowsOnPage, int pageNumber,
			QuestionSortConfig cfg, boolean ascending) {
		
		List<Object[]> queryResult = 
				questionRep.findForPageWithRatingIsAskedAndIsBookmarked(userId, 
						category, rowsOnPage, pageNumber, cfg, ascending);
		
		List<QuestionFrequentAskedDTO> result = new LinkedList<QuestionFrequentAskedDTO>();
		
		for (Object[] row : queryResult) {
			Question q = (Question) row[0];
			BigInteger rating = (BigInteger) row[1];
			Boolean isAsked = (Boolean) row[2];
			Boolean isBookmarked = (Boolean) row[3];
			result.add(new QuestionFrequentAskedDTO(
					q.getId(),
					q.getValue(),
					q.getLoadDate(),
					q.getCategory(),
					q.getTags(),
					rating.longValue(),
					isAsked,
					isBookmarked,
					q.getUser(),
					q.getViews(),
					q.getDescription()));
		}
		
		return result;
	}

	@Override
	public int getPagesCount(Category category, int rowsOnPage) {
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

	@Override
	public Question getQuestionById(Long questionId) {
		// TODO Auto-generated method stub
		return questionRep.findById(questionId);
	}

	@Override
	public Long save(Question question) {
		return questionRep.save(question);
	}

    @Override
    @Transactional
    public void addView(Long questionId) {
        Question question = getQuestionById(questionId);
        if (question==null) {
			return;
		}
		question.setViews(question.getViews()+1);
        save(question);
    }

	@Override
	public List<QuestionFrequentAskedDTO> getBookmarkedByUser(long userId) {
		List<Object[]> queryResult = questionRep.findBookmarkedByUser(userRep.getUserById(userId));
		List<QuestionFrequentAskedDTO> result = new LinkedList<QuestionFrequentAskedDTO>();
		
		for (Object[] row : queryResult) {
			Question q = (Question) row[0];
			BigInteger rating = (BigInteger) row[1];
			Boolean isAsked = (Boolean) row[2];
			Boolean isBookmarked = (Boolean) row[3];
			result.add(new QuestionFrequentAskedDTO(
					q.getId(),
					q.getValue(),
					q.getLoadDate(),
					q.getCategory(),
					q.getTags(),
					rating.longValue(),
					isAsked,
					isBookmarked,
					q.getUser(),
					q.getViews(),
					q.getDescription()));
		}
		return result;
	}

	@Override
	public int getPagesCountBookmarked(Long userId, Integer rowsOnPage) {
		int  result =  questionRep.getRecordsCountBookmarked(userId);
		if (result % rowsOnPage ==0) 
			return result/rowsOnPage;
		else
			return result/rowsOnPage+1;
	}

	@Override
	public int getRecordsCountBookmarked(Long userId) {
		return questionRep.getRecordsCountBookmarked(userId);
	}
}
