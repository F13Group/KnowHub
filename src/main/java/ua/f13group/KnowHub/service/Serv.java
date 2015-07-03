package ua.f13group.KnowHub.service;

import ua.f13group.KnowHub.domain.QuestionSortConfig;
import ua.f13group.KnowHub.repository.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

@Service("serv")
public class Serv {
	
	
	private static QuestionRepository questionRepository;
	
	//for spring test 
	public static void main(String []str){
		
		@SuppressWarnings("resource")
		ApplicationContext ap = new ClassPathXmlApplicationContext("spring/spring-config.xml");
		questionRepository = (QuestionRepository) ap.getBean("questionRepository");
		
		System.out.println(questionRepository.testCriteria(5,1,QuestionSortConfig.RATING));
	}

}

