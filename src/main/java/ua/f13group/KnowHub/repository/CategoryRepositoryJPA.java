package ua.f13group.KnowHub.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import ua.f13group.KnowHub.domain.Category;

//@ImportResource("classpath:spring/spring-config.xml")
@Repository("categoryRepository")
public class CategoryRepositoryJPA implements CategoryRepository {

	@PersistenceContext
	private EntityManager entityManager;
	
	public List<Category> findAll() {
		TypedQuery<Category> query = entityManager.createNamedQuery("Category.findAll", Category.class);
		
		return query.getResultList();
	}
}
