package ua.f13group.KnowHub.web;

import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;

public class HomePageControllerTest {

	@Test
	@Ignore
	public void homePageAllTest(){
		
		HomePageController homePageController = new HomePageController();
		String expResult = "index";
		String result = homePageController.homePageAll();
		assertTrue(result.equals(expResult));
		
	}
}
