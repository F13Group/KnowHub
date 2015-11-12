package ua.f13group.KnowHub.service.jpaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.f13group.KnowHub.domain.Bookmark;
import ua.f13group.KnowHub.repository.BookmarkRepository;
import ua.f13group.KnowHub.service.BookmarkService;

@Service("bookmarkService")
public class JPABookmarkService implements BookmarkService {

    @Autowired
    BookmarkRepository bookmarkRepository;

    @Override
    public Boolean isBookmarked(Long userId, Long questionId) {
        return bookmarkRepository.isBookmarked(userId, questionId);
    }

    @Override
    public Long save(Bookmark bookmark) {
        return bookmarkRepository.save(bookmark);
    }

    @Override
    public Long unbookmark(Long userId, Long questionId) {
        return bookmarkRepository.unbookmark(userId, questionId);
    }
}
