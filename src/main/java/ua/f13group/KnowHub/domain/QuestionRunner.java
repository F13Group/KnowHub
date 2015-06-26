package ua.f13group.KnowHub.domain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import ua.f13group.KnowHub.service.CategoryService;
import ua.f13group.KnowHub.service.QuestionService;

@Service("QR")
public class QuestionRunner {

	@Autowired
	QuestionService qs ;
	
	@Autowired
	CategoryService cs;
	
	public static void main(String[] args) {
		
				
		@SuppressWarnings("resource")
		ApplicationContext ap = new ClassPathXmlApplicationContext("spring/spring-config.xml");
		QuestionRunner  qr = (QuestionRunner) ap.getBean("QR");
		
		//qs.getPagesCount(Category category, int rowsOnPage);
		System.out.println("total pages: "+ qr.qs.getPagesCount(4));	
		
		for(int i = 1; i<=qr.qs.getPagesCount(4) ; i++){
			System.out.println("page : " + i);
			for( Question q: qr.qs.getQuestionsForPage(4, i))
			{
				System.out.println(q.getValue());
			}
		}
		Category cat = qr.cs.findAll().get(5);
		
		System.out.println("pages in category 1 : "+ qr.qs.getPagesCount(cat,4));	
		
		for(int i = 1; i<=qr.qs.getPagesCount(cat, 4) ; i++){
			System.out.println("page : " + i);
			for( Question q: qr.qs.getQuestionsForPage(cat, 4, i))
			{
				System.out.println(q.getValue());
			}
		}
		
	}

}
