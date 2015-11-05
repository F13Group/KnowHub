package ua.f13group.KnowHub.service.jpaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.f13group.KnowHub.domain.Confirmation;
import ua.f13group.KnowHub.repository.UserRepository;
import ua.f13group.KnowHub.service.ConfirmationService;

/**
 * Created by dennis on 11/5/2015.
 */
@Service
public class JpaConfirmationService implements ConfirmationService {

    @Autowired
    UserRepository userRepository;

    @Override
    public void saveConfirmation(Confirmation confirmation) {
        userRepository.saveConfirmation(confirmation);
    }
}
