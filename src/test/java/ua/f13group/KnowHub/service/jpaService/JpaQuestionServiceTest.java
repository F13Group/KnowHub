package ua.f13group.KnowHub.service.jpaService;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.junit.*;

import static org.junit.Assert.*;

import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.mockito.Mockito.*;

import org.mockito.runners.MockitoJUnitRunner;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.QuestionSortConfig;
import ua.f13group.KnowHub.domain.Tag;
import ua.f13group.KnowHub.repository.QuestionRepository;
import ua.f13group.KnowHub.web.dto.QuestionFrequentAskedDTO;

@RunWith(MockitoJUnitRunner.class)
public class JpaQuestionServiceTest {
    
	@Mock
	Category categoryMock;
	
	@Mock
	Question questionMock;
	
	Question exampleQuestion;
	
	@Mock
    QuestionRepository questionRepositoryMock;
    
    @InjectMocks
    JpaQuestionService jpaQuestionServiceMock;    
    
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
    	MockitoAnnotations.initMocks(this);
    	
    	exampleQuestion = new Question();
    	exampleQuestion.setCategory(new Category());
    	exampleQuestion.setValue("question1");
    	exampleQuestion.setLoadDate(new Timestamp(0));
    	exampleQuestion.setTags(new ArrayList<Tag>());
    	exampleQuestion.setViews((long) 0);
    	
    	Object[] objectArray = {exampleQuestion, 
    			BigInteger.ONE, 
    			new Boolean(false), 
    			new Boolean(false)};
    	
    	ArrayList<Object[]> singleResultList = new ArrayList<Object[]>();
    	singleResultList.add(objectArray);
    	
    	when(questionRepositoryMock
    			.findForPageWithRatingIsAskedAndIsBookmarked(1, null, 1, 1, 
    					QuestionSortConfig.DATE, false))
    					.thenReturn(singleResultList);
    	
    	when(questionRepositoryMock
    			.findForPageWithRatingIsAskedAndIsBookmarked(1, categoryMock, 1, 1, 
    					QuestionSortConfig.DATE, false))
    					.thenReturn(singleResultList);
    	
    	when(questionRepositoryMock
    			.getRecordsCount()).thenReturn(25);
    	
    	when(questionRepositoryMock
    			.getRecordsCount(categoryMock)).thenReturn(20);
    	
    	when(questionRepositoryMock
    			.findById((long) 1)).thenReturn(null);
    	
    	when(questionRepositoryMock
    			.findById((long) 2)).thenReturn(exampleQuestion);
    	
    	when(questionRepositoryMock
    			.save(questionMock)).thenReturn((long) 10);
    	
    	when(questionRepositoryMock
    			.save(exampleQuestion)).thenReturn((long) 20);
    	
    	when(questionRepositoryMock
    			.getRecordsCountBookmarked((long) 1)).thenReturn(20);
    	
    	when(questionRepositoryMock
    			.findBookmarkedByUserPaginatedAndOrdered(1, 1, 1, 
    					QuestionSortConfig.DATE, false))
    					.thenReturn(singleResultList);
    	
    }
    
    @After
    public void tearDown() {
    }
    
    /**
     * Test of getQuestionsForPage method, of class JpaQuestionService.
     */
    @Test
    public void testGetQuestionsFrequentlyAskedForPageAndUserNoCategory() {
    	long userId = 1;
        int rowsOnPage = 1;
        int pageNumber = 1;
        QuestionSortConfig cfg = QuestionSortConfig.DATE;
        boolean ascending = false;        
        int expResult = 1;
        List<QuestionFrequentAskedDTO> result = 
        		jpaQuestionServiceMock.getQuestionsFrequentlyAskedForPageAndUser(
        				userId, rowsOnPage, pageNumber, cfg, ascending);
        
        assertEquals(expResult, result.size());
        
        verify(questionRepositoryMock, times(1))
        	.findForPageWithRatingIsAskedAndIsBookmarked(userId, null, rowsOnPage, pageNumber, 
        			cfg, ascending);
    }
    
    @Test
    public void testGetQuestionsFrequentlyAskedForPageAndUserCategoryPresent() {
    	long userId = 1;
        int rowsOnPage = 1;
        int pageNumber = 1;
        QuestionSortConfig cfg = QuestionSortConfig.DATE;
        boolean ascending = false;        
        int expResult = 1;
        List<QuestionFrequentAskedDTO> result = 
        		jpaQuestionServiceMock.getQuestionsFrequentlyAskedForPageAndUser(
        				userId, categoryMock, rowsOnPage, pageNumber, cfg, ascending);
        
        assertEquals(expResult, result.size());
        
        verify(questionRepositoryMock, times(1))
        	.findForPageWithRatingIsAskedAndIsBookmarked(userId, categoryMock, rowsOnPage, 
        		pageNumber,	cfg, ascending);
    }


    /**
     * Test of getPagesCount method, of class JpaQuestionService.
     */
    @Test
    public void testGetPagesCountNoCategory() {
    	int rowsOnPage1 = 15;        
        int expResult1 = 2;
        
        int rowsOnPage2 = 25;        
        int expResult2 = 1; 
        
        assertEquals(expResult1, jpaQuestionServiceMock.getPagesCount(rowsOnPage1));
        
        assertEquals(expResult2, jpaQuestionServiceMock.getPagesCount(rowsOnPage2));
        
        verify(questionRepositoryMock, times(2)).getRecordsCount();
    }
    
    @Test
    public void testGetPagesCountWithCategory() {
        int rowsOnPage1 = 15;        
        int expResult1 = 2;
        
        int rowsOnPage2 = 20;        
        int expResult2 = 1; 
        
        assertEquals(expResult1, jpaQuestionServiceMock
        		.getPagesCount(categoryMock, rowsOnPage1));
        
        assertEquals(expResult2, jpaQuestionServiceMock
        		.getPagesCount(categoryMock, rowsOnPage2));
        
        verify(questionRepositoryMock, times(2)).getRecordsCount(categoryMock);
    }
    

    /**
     * Test of getRecordsCount method, of class JpaQuestionService.
     */
    @Test
    public void testGetRecordsCountNoCategory() {       
        assertEquals(25, jpaQuestionServiceMock.getRecordsCount());
        verify(questionRepositoryMock, times(1)).getRecordsCount();
    }
    
    @Test
    public void testGetRecordsCountWithCategory() {       
        assertEquals(20, jpaQuestionServiceMock.getRecordsCount(categoryMock));        
        verify(questionRepositoryMock, times(1)).getRecordsCount(categoryMock);
    }
    
    
    /**
     * Test of getQuestionById method, of class JpaQuestionService.
     */
    @Test
    public void testGetQuestionByIdNotExisting() {       
        assertNull(jpaQuestionServiceMock.getQuestionById((long) 1));        
        verify(questionRepositoryMock, times(1)).findById((long) 1);
    }
    
    @Test
    public void testGetQuestionByIdExisting() {
    	Question res = jpaQuestionServiceMock.getQuestionById((long) 2);
    	
    	assertNotNull(res);
        assertTrue(res.getValue().contains("question1"));
        verify(questionRepositoryMock, times(1)).findById((long) 2);
    }
    
    
    /**
     * Test of save method, of class JpaQuestionService.
     */
    @Test
    public void testSave() {       
        assertEquals(10, jpaQuestionServiceMock.save(questionMock).intValue());        
        verify(questionRepositoryMock, times(1)).save(questionMock);
    }
    
    
    /**
     * Test of addView method, of class JpaQuestionService.
     */
    @Test
    public void testAddViewQuestionNotExists() {       
        jpaQuestionServiceMock.addView((long) 1);
        
        verify(questionRepositoryMock, times(0)).save(null);
    }
    
    @Test
    public void testAddViewQuestionExists() {       
    	jpaQuestionServiceMock.addView((long) 2);
    	
    	assertEquals(1, exampleQuestion.getViews().intValue());
        verify(questionRepositoryMock, times(1)).save(exampleQuestion);
    }
    
    
    /**
     * Test of getRecordsCountBookmarked method, of class JpaQuestionService.
     */
    @Test
    public void testGetRecordsCountBookmarkedNoRowsOnPage() {       
        assertEquals(20, jpaQuestionServiceMock.getRecordsCountBookmarked((long) 1));
        
        verify(questionRepositoryMock, times(1)).getRecordsCountBookmarked((long) 1);
    }
    
    
    /**
     * Test of getPagesCountBookmarked method, of class JpaQuestionService.
     */
    @Test
    public void testGetPagesCountBookmarkedWithRowsOnPageRemainderZero() {       
    	assertEquals(1, jpaQuestionServiceMock.getPagesCountBookmarked((long) 1, 20));
        
        verify(questionRepositoryMock, times(1)).getRecordsCountBookmarked((long) 1);
    }
    
    @Test
    public void testGetPagesCountBookmarkedWithRowsOnPageRemainderNonZero() {       
    	assertEquals(2, jpaQuestionServiceMock.getPagesCountBookmarked((long) 1, 11));
        
        verify(questionRepositoryMock, times(1)).getRecordsCountBookmarked((long) 1);
    }

    
    /**
     * Test of getQuestionsBookmarked method, of class JpaQuestionService.
     */
    @Test
    public void testGetQuestionsBookmarked() {
    	long userId = 1;
        int rowsOnPage = 1;
        int pageNumber = 1;
        QuestionSortConfig cfg = QuestionSortConfig.DATE;
        boolean ascending = false;        
        int expResult = 1;
        
        List<QuestionFrequentAskedDTO> result = 
        		jpaQuestionServiceMock.getQuestionsBookmarked(
        				userId, rowsOnPage, pageNumber, cfg, ascending);
        
        assertEquals(expResult, result.size());
        
        verify(questionRepositoryMock, times(1))
        	.findBookmarkedByUserPaginatedAndOrdered(userId, rowsOnPage, pageNumber, 
        			cfg, ascending);
    }
}
