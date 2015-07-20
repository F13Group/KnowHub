/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.f13group.KnowHub.web;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import static org.mockito.Mockito.*;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.MapBindingResult;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.service.UserService;

/**
 *
 * @author amd
 */
@RunWith(MockitoJUnitRunner.class)
public class SignUpControllerTest {
    
    public SignUpControllerTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    @Mock
    private UserService userService;
    
    @InjectMocks
    SignUpController signUpController;
    
    
//    /**
//     * Test of signup method, of class SignUpController.
//     */
//    @Test
//    public void testSignup_ModelAndView() {
//        System.out.println("signup");
//        ModelAndView model = null;
//        SignUpController instance = new SignUpController();
//        ModelAndView expResult = null;
//        ModelAndView result = instance.signup(model);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of signup method, of class SignUpController.
     */
    @Test
    public void testSignupWhenBindingResultHasErrors() {
        System.out.println("signup");
        User newUser = new User();
        when(userService.saveUser(newUser)).thenReturn(1);
        BindingResult result_2 = mock(BindingResult.class);
        when(result_2.hasErrors()).thenReturn(Boolean.TRUE);
        ModelAndView model = new ModelAndView();
        SignUpController instance = new SignUpController();
        User expResult = newUser;
        model.setViewName("signup");
        String expResult2 = "signup";
        ModelAndView result = instance.signup(newUser, result_2, model);
        assertEquals(expResult, result.getModelMap().get("newUser"));
        assertEquals(expResult2, result.getViewName());
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
}
