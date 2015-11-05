package ua.f13group.KnowHub.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.f13group.KnowHub.domain.Confirmation;
import ua.f13group.KnowHub.domain.ConfirmationType;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.service.ConfirmationService;
import ua.f13group.KnowHub.service.MailService;
import ua.f13group.KnowHub.service.UserService;

import java.math.BigInteger;
import java.security.SecureRandom;

/**
 * Created by dennis on 11/5/2015.
 */
@Controller
public class PasswordRestoringController {

    @Autowired
    private UserService userService;
    @Autowired
    private MailService mailService;
    @Autowired
    private ConfirmationService confirmationService;

    private SecureRandom secureRandom = new SecureRandom();

    @RequestMapping(value = "restore", method = RequestMethod.POST)
    public String restore(String email,Model model){

        User user = userService.getUserByLogin(email);

        if (user!=null){
            Confirmation confirmation = new Confirmation(user);
            confirmation.setLink(new BigInteger(130, secureRandom).toString(50));
            confirmation.setConfirmationType(ConfirmationType.rest);
            confirmationService.saveConfirmation(confirmation);

            String subject = "Restore password";
            String text = "Thank you for joining KnowHub! To get started, you need to verify your email address. Please go to the link below and log in: \n\r";
            text += ("http://epuakyiw1793t6.kyiv.epam.com:8085/knowhub/restore_password/" + confirmation.getLink());
            mailService.sendMail(email,subject,text);
        }


        model.addAttribute("success");

        return "restore";
    }

}
