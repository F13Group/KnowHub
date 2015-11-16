package ua.f13group.KnowHub.web;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ua.f13group.KnowHub.domain.Confirmation;
import ua.f13group.KnowHub.domain.ConfirmationType;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.repository.UserRepository;
import ua.f13group.KnowHub.service.ConfirmationService;
import ua.f13group.KnowHub.service.MailService;
import ua.f13group.KnowHub.service.UserService;

import java.math.BigInteger;
import java.security.SecureRandom;

import static org.junit.Assert.*;

/**
 * Created by dennis on 11/5/2015.
 */
@ContextConfiguration(locations = {"classpath:spring/spring-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class PasswordRestoringControllerTest {

    @Autowired
    private UserService userService;
    @Autowired
    private MailService mailService;
    @Autowired
    private ConfirmationService confirmationService;

    private SecureRandom secureRandom = new SecureRandom();


    @Test
    @Ignore
    public void testRestore() throws Exception {
        String email = "i.duran@yandex.ru";

        User user = userService.getUserByLogin(email);

        Confirmation confirmation = new Confirmation(user);
        confirmation.setLink(new BigInteger(130, secureRandom).toString(50));
        confirmation.setConfirmationType(ConfirmationType.rest);
        confirmationService.saveConfirmation(confirmation);

        String subject = "Restore password";
        String text = "You recieved this message because you want to reset password. To restore your password please go to the link below: \n\r";
        text += ("http://epuakyiw1793t6.kyiv.epam.com:8085/knowhub/restore_password/" + confirmation.getLink());
        text += "\n\r If you did not make a request please ignore this message.";
        mailService.sendMail(email,subject,text);

    }
}