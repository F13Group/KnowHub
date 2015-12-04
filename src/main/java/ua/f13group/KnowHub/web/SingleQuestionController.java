package ua.f13group.KnowHub.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ua.f13group.KnowHub.service.QuestionService;

@Controller
@RequestMapping(value = "/question")
public class SingleQuestionController {
	
	@Autowired
    QuestionService questionService;


	@RequestMapping(value = "/{questionId}", method = RequestMethod.GET)
    public String getQuestion(
            @PathVariable Long questionId,
            Principal principal) {
		
        questionService.addView(questionId);

		return "question";
	}
}
