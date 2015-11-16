package ua.f13group.KnowHub.service.jpaService;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ua.f13group.KnowHub.domain.Confirmation;
import ua.f13group.KnowHub.domain.ConfirmationType;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.repository.UserRepository;
import ua.f13group.KnowHub.service.UserService;

import static org.junit.Assert.*;

/**
 * Created by dennis on 11/5/2015.
 */
@ContextConfiguration(locations = {"classpath:spring/spring-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class JpaUserServiceTest {

    @Autowired
    UserService userService;
    @Autowired
    UserRepository userRepository;

    @Test
    @Ignore
    public void testSaveUser() throws Exception {

        Confirmation confirmation = new Confirmation();
        confirmation.setConfirmationType(ConfirmationType.rest);
        confirmation.setLink("687654567890965");
        User user = new User();
        user.setEnabled(true);
        user.setLogin("i.duran@yandex.ru");
        user.setPassword("afdfdsfdsfasdf");
        userService.saveUser(user);
        userRepository.saveConfirmation(confirmation);

    }
}