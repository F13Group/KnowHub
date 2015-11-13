/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.f13group.KnowHub.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ua.f13group.KnowHub.domain.Confirmation;
import ua.f13group.KnowHub.domain.User;

/**
 *
 * @author amd
 */
@Repository
public class UserRepositoryJPA implements UserRepository {

    @PersistenceContext
    private EntityManager entityManager;
    
    @Transactional
    @Override
    public Integer saveUser(User user) {
        entityManager.persist(user);
        return user.getUserId().intValue();
    }

	@Override
	public Confirmation getConfirmationByLink(String link) {
		TypedQuery<Confirmation> query = entityManager.createNamedQuery("Confirmation.findConfirmationByLink", Confirmation.class);
		query.setParameter("link", link);
		
		Confirmation confirmation; 
		try { confirmation = query.getSingleResult();
			
		} catch (javax.persistence.NoResultException e) {
			return null;
		}
		
		return confirmation;
	}

	@Override
	public User getUserByLogin(String login) {
		TypedQuery<User> query = entityManager.createNamedQuery("User.findByLogin", User.class);
		query.setParameter("login", login);
		User user;
		try { user = query.getSingleResult();
			
		} catch (javax.persistence.NoResultException e) {
			return null;
		}
		
		return user;
	}

	@Transactional
	@Override
	public void saveConfirmation(Confirmation confirm) {
		entityManager.persist(confirm);
	}

	@Override
	public void deleteConfirmation(Confirmation confirm) {
		entityManager.remove(confirm);
	}

	@Transactional
	@Override
	public void deleteUser(User newUser) {
		entityManager.remove(newUser);
		
	}

	@Override
	public Confirmation getConfirmationByUserId(Long userId) {
		TypedQuery<Confirmation> query = entityManager.createNamedQuery("Confirmation.findByUserId", Confirmation.class);
		query.setParameter("userid", userId);
		
		Confirmation confirmation;
		try { confirmation = query.getSingleResult();
			
		} catch (javax.persistence.NoResultException e) {
			return null;
		}
		
		return confirmation;
	}

	@Override
	public Confirmation getConfirmationByUserLogin(String login) {
		TypedQuery<Confirmation> query = entityManager.createNamedQuery("Confirmation.findByLogin", Confirmation.class);
		query.setParameter("login", login);
		
		Confirmation confirmation;
		try { confirmation = query.getSingleResult();
			
		} catch (javax.persistence.NoResultException e) {
			return null;
		}
		
		return confirmation;
	}

	@Override
	public Confirmation getRestorePassByLink(String generatedLink) {
		TypedQuery<Confirmation> query = entityManager.createNamedQuery("Confirmation.findRestorePassByLink", Confirmation.class);
		query.setParameter("link", generatedLink);
		
		Confirmation confirmation; 
		try { confirmation = query.getSingleResult();
			
		} catch (javax.persistence.NoResultException e) {
			return null;
		}
		
		return confirmation;
	}

	@Transactional
	@Override
	public void editUser(User user) {
		entityManager.merge(user);		
	}
}
