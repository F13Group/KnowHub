package ua.f13group.KnowHub.repository;

import ua.f13group.KnowHub.domain.Confirmation;

/**
 * Created by dennis on 11/10/2015.
 */
public interface ConfirmationRepository {
    public void deleteOldConfirmations(Long id);
}
