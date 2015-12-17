package ua.f13group.KnowHub.service.jpaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.f13group.KnowHub.domain.Like;
import ua.f13group.KnowHub.repository.LikeRepository;
import ua.f13group.KnowHub.service.LikeService;

@Service
public class JPALikeService implements LikeService {

	@Autowired
	private LikeRepository likeRep;
	
	@Override
	public Long addLike(Like like) {
		if (like != null) {
			return likeRep.createLike(like);
		}
		return null;
	}

	@Override
	public boolean removeLike(Like like) {
		if (like != null) {
			return likeRep.removeLike(like);
		}
		return false;
	}

}
