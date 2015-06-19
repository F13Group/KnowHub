package ua.f13group.KnowHub.web;

import static org.junit.Assert.*;

import org.junit.Test;

public class HomePageControllerTest {

	@Test
	public void homePageAllTest(){
		
		HomePageController homePageController = new HomePageController();
		String expResult = "homePage";
		String result = homePageController.homePageAll();
		assertTrue(result.equals(expResult));
		
	}
}
