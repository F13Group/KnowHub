package ua.f13group.KnowHub.service.jpaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.f13group.KnowHub.domain.Rating;
import ua.f13group.KnowHub.repository.RatingRepository;
import ua.f13group.KnowHub.service.RatingService;

/**
 * Created by dennis on 10/20/2015.
 */
@Service("ratingService")
public class JpaRatingService implements RatingService {

    @Autowired
    RatingRepository ratingRepository;

    @Override
    public Long save(Rating rating) {
        return ratingRepository.save(rating);
    }

    @Override
    public Boolean ifLiked(Long userId, Long questionId) {
        return ratingRepository.ifLiked(userId,questionId);
    }

    @Override
    public Long countLikesByQuestionId(Long questionId) {
        return ratingRepository.countLikesByQuestionId(questionId);
    }
}
