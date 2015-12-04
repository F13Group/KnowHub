
package ua.f13group.KnowHub.service;

import ua.f13group.KnowHub.domain.Bookmark;

public interface BookmarkService {

    Boolean isBookmarked(Long userId, Long questionId);
    Long save(Bookmark bookmark);
    Long unbookmark(Long userId, Long questionId);

}
