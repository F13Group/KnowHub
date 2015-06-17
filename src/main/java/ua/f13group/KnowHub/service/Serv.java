package ua.f13group.KnowHub.service;

import ua.f13group.KnowHub.repository.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

@Service("serv")
public class Serv {
	
	@Autowired
	private Rep rep;
	
	//for spring test 
	public static void main(String []str){
		
		@SuppressWarnings("resource")
		ApplicationContext ap = new ClassPathXmlApplicationContext("SpringConfig.xml");
		Serv  s = (Serv) ap.getBean("serv");
		
		s.rep.print();
	}

}
