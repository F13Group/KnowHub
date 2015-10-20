package ua.f13group.KnowHub.repository;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 * Created by dennis on 10/20/2015.
 */
@Repository("ratingRepository")
public class RatingRepositoryJPA implements RatingRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Boolean ifLiked(Long userId, Long questionId) {
        TypedQuery<Boolean> typedQuery = entityManager.createNamedQuery("Rating.ifLiked", Boolean.class)
                .setParameter("questionId", questionId)
                .setParameter("userId",userId);
        return typedQuery.getSingleResult();
    }

    @Override
    public Long countLikesByQuestionId(Long questionId) {
        TypedQuery<Long> typedQuery = entityManager.createNamedQuery("Rating.countLikesByQuestionId", Long.class)
                .setParameter("questionId", questionId);
        return typedQuery.getSingleResult();
    }
}
