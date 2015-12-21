package ua.f13group.KnowHub.repository;

import ua.f13group.KnowHub.domain.Like;

public interface LikeRepository {
	public Long createLike(Like like);
	public boolean removeLike(Like like);
	public Like getLikeById(Long id);
	public Long getLikeIdByUserIdAndCommentId(Long userId, Long commentId);
}
