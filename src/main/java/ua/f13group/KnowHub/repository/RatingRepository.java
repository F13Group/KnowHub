package ua.f13group.KnowHub.repository;

import ua.f13group.KnowHub.domain.Question;
import ua.f13group.KnowHub.domain.User;

import java.util.List;

/**
 * Created by dennis on 10/20/2015.
 */
public interface RatingRepository {
    public Boolean ifLiked(Long userId, Long questionId);
    public Long countLikesByQuestionId(Long questionId);
}
