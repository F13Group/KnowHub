package ua.f13group.KnowHub.repository;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ua.f13group.KnowHub.domain.Confirmation;

import javax.persistence.EntityManager;
import javax.persistence.NamedQuery;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 * Created by dennis on 11/10/2015.
 */
@Repository("confirmationRepository")
public class ConfirmationRepositoryJPA implements ConfirmationRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @Transactional
    public void deleteOldConfirmations(Long id) {
        entityManager.createNamedQuery("Confirmation.clearOldLinks").setParameter("id",id).executeUpdate();
    }
}
