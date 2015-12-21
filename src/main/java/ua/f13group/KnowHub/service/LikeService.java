package ua.f13group.KnowHub.service;

import ua.f13group.KnowHub.domain.Like;

public interface LikeService {
	public Long addLike(Like like);
	public boolean removeLike(Like like);
	public Like getLikeById(Long id);
<<<<<<< HEAD
	
=======
	public Long getLikeIdByUserIdAndCommentId(Long userId, Long commentId);
>>>>>>> refs/remotes/origin/dennis_branch
}
