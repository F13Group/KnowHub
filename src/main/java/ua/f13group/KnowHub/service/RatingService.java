package ua.f13group.KnowHub.service;

import ua.f13group.KnowHub.domain.Rating;

/**
 * Created by dennis on 10/20/2015.
 */
public interface RatingService {

    public Boolean ifLiked(Long userId, Long questionId);
    public Long countLikesByQuestionId(Long questionId);
    public Long save(Rating rating);
}
