package ua.f13group.KnowHub.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import ua.f13group.KnowHub.domain.Like;

@Repository
public class LikeRepositoryJPA implements LikeRepository {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional
	public Long createLike(Like like) {
		if (like.getId() != null) {
            entityManager.merge(like);
        } else {
            entityManager.persist(like);
        }
		return like.getId();
	}

	@Override
	@Transactional
	public boolean removeLike(Like like) {
		entityManager.remove(like);
		return false;
	}

}
