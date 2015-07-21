/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.f13group.KnowHub.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import ua.f13group.KnowHub.domain.Category;
import ua.f13group.KnowHub.domain.User;

/**
 *
 * @author amd
 */
@Repository
public class UserRepositoryJPA implements UserRepository {

    @PersistenceContext
    private EntityManager entityManager;
    
    
    @Override
    public Integer saveUser(User user) {
        entityManager.persist(user);
        return user.getUserId().intValue();
    }

	@Override
	public User getUserByLink(String userlink) {
		TypedQuery<User> query = entityManager.createNamedQuery("User.findByLink", User.class);
		query.setParameter("link", userlink);
		
		return query.getSingleResult();
	}
    
}
