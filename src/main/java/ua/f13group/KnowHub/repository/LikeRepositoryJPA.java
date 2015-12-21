package ua.f13group.KnowHub.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
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
		//entityManager.remove(like);
		entityManager.remove(entityManager.contains(like) ? like : entityManager.merge(like));
		return false;
	}

	@Override
	public Like getLikeById(Long id) {
<<<<<<< HEAD
		return entityManager.find(Like.class, id);		
	}

=======
		return entityManager.find(Like.class, id);
	}

	@Override
	public Long getLikeIdByUserIdAndCommentId(Long userId, Long commentId) {
		TypedQuery<Long> query = entityManager.createNamedQuery("Like.getLikeIdByUserIdAndCommentId",Long.class)
				.setParameter("userId", userId)
				.setParameter("commentId", commentId);

		Long id;
		try { id = query.getSingleResult();

		} catch (javax.persistence.NoResultException e) {
			return null;
		}

		return id;
	}
>>>>>>> refs/remotes/origin/dennis_branch
}
