package ua.f13group.KnowHub.web;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.service.QuestionService;
import ua.f13group.KnowHub.web.dto.QuestionFrequentAskedDTO;

@Controller
@RequestMapping(value = "/question")
public class SingleQuestionController {
	
	@Autowired
    QuestionService questionService;


	@RequestMapping(value = "/{questionId}", method = RequestMethod.GET)
    public String getQuestion(
            @PathVariable Long questionId,
            Principal principal) {
		
		//addView adds one more "look" for question to db
        questionService.addView(questionId);

		return "question";
	}
}
