package ua.f13group.KnowHub.service;

import ua.f13group.KnowHub.domain.Like;

public interface LikeService {
	public Long addLike(Like like);
	public boolean removeLike(Like like);
}
