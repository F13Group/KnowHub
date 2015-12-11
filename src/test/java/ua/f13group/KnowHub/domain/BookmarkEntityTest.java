package ua.f13group.KnowHub.domain;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class BookmarkEntityTest {
	
//	 @Autowired;
//	 EntityManager em;

	@Test
	@Ignore
	public void testAddNewEntityToDB() {
		
		 System.out.println("testing");
		 
		 EntityManagerFactory emf = Persistence.createEntityManagerFactory("hibernateUnit");
		 
		 System.out.println(emf!=null);
		 
		 EntityManager em = emf.createEntityManager();
		 
		 Bookmark testBookmark = new Bookmark();
		 
		 testBookmark.setQuestionId(Long.valueOf(1));
		 testBookmark.setUserId(Long.valueOf(104));
		 
		 System.out.println(testBookmark.getQuestionId());
		 
		 try {
	            em.getTransaction().begin();
	            em.persist(testBookmark);
	            em.flush();
	            em.getTransaction().commit();
	            
	            System.out.println("testing new bookmark Id"+testBookmark.getId());
	            
	            em.getTransaction().begin();
	            em.remove(testBookmark);
	            em.getTransaction().commit();
	            
	        } finally {
	            if (em.getTransaction().isActive()) {
	                em.getTransaction().rollback();
	            }
	        }
	}
	
}
