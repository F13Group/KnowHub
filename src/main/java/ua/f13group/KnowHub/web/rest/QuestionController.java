package ua.f13group.KnowHub.web.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.service.QuestionService;

@RestController
@RequestMapping(value="/question")
public class QuestionController {
	
	@Autowired
	QuestionService questionService;

	 @RequestMapping(method = RequestMethod.GET)
	    public List<Question> getAllQuestions() {
	        return questionService.findAll();
	    }
	 
	 @RequestMapping(value = "/{category}",method = RequestMethod.GET)
	    public List<Question> getAllQuestions(@PathVariable Category category) {
	        return questionService.findAll(/*category*/);
	    }
	
}
