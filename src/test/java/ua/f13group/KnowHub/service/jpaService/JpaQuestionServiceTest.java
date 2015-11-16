/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.f13group.KnowHub.service.jpaService;

import java.util.List;

import org.junit.*;

import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import static org.mockito.Mockito.*;
import org.mockito.runners.MockitoJUnitRunner;
import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.QuestionSortConfig;
import ua.f13group.KnowHub.repository.QuestionRepository;

/**
 *
 * @author amd
 */
@RunWith(MockitoJUnitRunner.class)
public class JpaQuestionServiceTest {
    
    public JpaQuestionServiceTest() {
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
    QuestionRepository questionRepository;
    
    @InjectMocks
    JpaQuestionService jpaQuestionService;
    
//    /**
//     * Test of getQuestionsForPage method, of class JpaQuestionService.
//     */
//    @Test
//    public void testGetQuestionsForPage_4args() {
//        System.out.println("getQuestionsForPage");
//        int rowsOnPage = 0;
//        int pageNumber = 0;
//        QuestionSortConfig cfg = null;
//        boolean ascending = false;
//        JpaQuestionService instance = new JpaQuestionService();
//        List<Question> expResult = null;
//        List<Question> result = instance.getQuestionsForPage(rowsOnPage, pageNumber, cfg, ascending);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getQuestionsForPage method, of class JpaQuestionService.
//     */
//    @Test
//    public void testGetQuestionsForPage_5args() {
//        System.out.println("getQuestionsForPage");
//        Category category = null;
//        int rowsOnPage = 0;
//        int pageNumber = 0;
//        QuestionSortConfig cfg = null;
//        boolean ascending = false;
//        JpaQuestionService instance = new JpaQuestionService();
//        List<Question> expResult = null;
//        List<Question> result = instance.getQuestionsForPage(category, rowsOnPage, pageNumber, cfg, ascending);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getPagesCount method, of class JpaQuestionService.
//     */
//    @Test
//    public void testGetPagesCount_Category_int() {
//        System.out.println("getPagesCount");
//        Category category = null;
//        int rowsOnPage = 0;
//        JpaQuestionService instance = new JpaQuestionService();
//        int expResult = 0;
//        int result = instance.getPagesCount(category, rowsOnPage);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of getPagesCount method, of class JpaQuestionService.
     */
    @Test
    @Ignore
    public void testGetPagesCount_int() {
        System.out.println("getPagesCount");
        int rowsOnPage = 15;
        JpaQuestionService instance = jpaQuestionService;
        int expResult = 2;
        when(questionRepository.getRecordsCount()).thenReturn(25);
        int result = instance.getPagesCount(rowsOnPage);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getRecordsCount method, of class JpaQuestionService.
     */
    @Test
    @Ignore
    public void testGetRecordsCount() {
        System.out.println("getRecordsCount");
        JpaQuestionService instance = jpaQuestionService;
        
        when(questionRepository.getRecordsCount()).thenReturn(25);
        
        int expResult = 25;
        int result = instance.getRecordsCount();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

//    /**
//     * Test of getRecordsCount method, of class JpaQuestionService.
//     */
//    @Test
//    public void testGetRecordsCount_Category() {
//        System.out.println("getRecordsCount");
//        Category category = null;
//        JpaQuestionService instance = new JpaQuestionService();
//        int expResult = 0;
//        int result = instance.getRecordsCount(category);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//    
}
