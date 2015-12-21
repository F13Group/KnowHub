package ua.f13group.KnowHub.domain;



import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

public class CommentEntityTest {
	
	 EntityManagerFactory emf;
	 EntityManager em;
	 
	@Before
	public void testInitialization() {
		 
		System.out.println("testing");
		 
		 emf = Persistence.createEntityManagerFactory("TESTHiberantePostgreSQL");
		 
		 System.out.println(emf!=null);
		 
		 em = emf.createEntityManager();
	}
	 
	@Test
	@Ignore
	public void testAddNewEntityToDB() {
		 
         Comment curComment = new Comment();
         curComment.setUser(em.find(User.class, 136L));
         curComment.setDate(new Date());
         curComment.setValue("TakSebe comment");
         curComment.setQuestion(em.find(Question.class, 9L));
         curComment.setRating(0);
		 
		 System.out.println("next stage");
		 
		 try {
	            em.getTransaction().begin();
	            em.persist(curComment);
	            em.flush();
	            em.getTransaction().commit();
	            
	            System.out.println("new comment created with Id"+curComment.getId());
	            
	            em.getTransaction().begin();
	            em.remove(curComment);
	            em.getTransaction().commit();
	            
	        } finally {
	            if (em.getTransaction().isActive()) {
	                em.getTransaction().rollback();
	            }
	        }
	}
	
	@Test
	@Ignore
	public void testGetAllQuestionComments() {
		TypedQuery<Comment> query = em.createNamedQuery(
				"Comment.getAllQuestionComments", Comment.class);
		query.setParameter("questionId", 9L);		
		
		for (Comment i : query.getResultList()) {
			System.out.println(i.getValue());
		};
	}
	
	@Test
	@Ignore
	public void getAllAuthorComments() {
		TypedQuery<Comment> query = em.createNamedQuery(
				"Comment.getAllAuthorsComments", Comment.class);
		query.setParameter("userId", 136L);		
		
		for (Comment i : query.getResultList()) {
			System.out.println(i.getValue());
		};
	}
	
	
	
	
}
