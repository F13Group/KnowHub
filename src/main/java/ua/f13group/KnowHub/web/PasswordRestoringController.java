package ua.f13group.KnowHub.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
    @Autowired
    protected MessageSource messageSource;

    private SecureRandom secureRandom = new SecureRandom();

    @RequestMapping(value = "restore", method = RequestMethod.POST)
    public String restore(@RequestParam String login,Model model){

        User user = userService.getUserByLogin(login);

        if (user!=null){

            Confirmation confirmation = new Confirmation(user);
            confirmation.setLink(new BigInteger(130, secureRandom).toString(50));
            confirmation.setConfirmationType(ConfirmationType.rest);
            confirmationService.deleteOldConfirmations(user.getUserId());
            confirmationService.saveConfirmation(confirmation);

            String subject = "Restore password";
            String text = "You recieved this message because you requested restoring password. If you did that, follow the link: \n\r";
            text += ("http://epuakyiw1793t6.kyiv.epam.com:8085/knowhub/restore_password/" + confirmation.getLink());
            text += ("\n\r This link will be active 24 hours.");
            text += ("\n\r If you did not do the request - please, ignore this message.");
            mailService.sendMail(login,subject,text);
        }


        model.addAttribute("notificationMessage", messageSource.getMessage("info.restorepasswordpage.emailSent",
                new Object[]{login}, null));
        return "restore";
    }

}
