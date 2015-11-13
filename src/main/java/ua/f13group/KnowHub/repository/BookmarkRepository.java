
package ua.f13group.KnowHub.repository;

import ua.f13group.KnowHub.domain.Bookmark;

public interface BookmarkRepository {
    Boolean isBookmarked(Long userId, Long questionId);
    Long save(Bookmark bookmark);
    Long unbookmark(Long userId, Long questionId);
}

