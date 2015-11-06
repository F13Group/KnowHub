package ua.f13group.KnowHub.repository;

import org.springframework.stereotype.Repository;
import ua.f13group.KnowHub.domain.Bookmark;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

@Repository("bookmarkRepository")
public class BookmarkRepositoryJPA implements BookmarkRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Boolean isBookmarked(Long userId, Long questionId) {
        TypedQuery<Boolean> typedQuery = entityManager.createNamedQuery("Bookmark.isBookmarked", Boolean.class)
                .setParameter("questionId", questionId)
                .setParameter("userId", userId);
        return typedQuery.getSingleResult();
    }

    @Override
    @Transactional
    public Long save(Bookmark bookmark) {
        entityManager.persist(bookmark);
        return bookmark.getId();
    }


    @Override
    @Transactional
    public Long unbookmark(Long userId, Long questionId) {
        TypedQuery<Boolean> typedQuery = entityManager.createNamedQuery("Bookmark.unbookmark", Boolean.class)
                .setParameter("questionId", questionId)
                .setParameter("userId", userId);
        return questionId;
    }
}
