package ua.f13group.KnowHub.repository;

import ua.f13group.KnowHub.domain.Like;

public interface LikeRepository {
	public boolean createLike(Like like);
	public boolean removeLike(Like like);
}
