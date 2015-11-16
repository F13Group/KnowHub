package ua.f13group.KnowHub.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import ua.f13group.KnowHub.domain.Confirmation;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.repository.UserRepository;

@Controller
public class ChangePasswordController extends AbstractSignUpController {

    private static final int CHANGE_PASS_EXPIRATION_PERIOD = 24 * 60 * 60 * 1000;

    @Autowired
    UserRepository userRepository;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @RequestMapping(value = "/restore_password", method = RequestMethod.GET)
    public String redirectToRestorePage(Model model) {
        return "redirect:/restore";
    }

    @RequestMapping(value = "/restore_password/{generatedLink}")
    public String checkReceivedLink(Model model, @PathVariable String generatedLink) {
        Confirmation confirmation = userRepository.getRestorePassByLink(generatedLink);
        if (confirmation == null) {
            return null;
        } else {
            if (confirmation.getRegDate().getTime() + CHANGE_PASS_EXPIRATION_PERIOD > System.currentTimeMillis()) {
                model.addAttribute("user_id", confirmation.getUser().getUserId());
                return "reset";
            }
        }
        return null;
    }

    /* The method valid entered passwords and rewrite user entity password */
    @RequestMapping(value = "/reset_password", method = RequestMethod.POST)
    public String resetPassword(
            @ModelAttribute User newUser,
            Model model,
            @RequestParam(value = "id", required = true) Long id) {

        User user = new User();
        user = userRepository.getUserById(id);

        //User user = userRepository.getUserByLogin(newUser.getLogin());


        if (!newUser.getPassword().equals(newUser.getPassword2())) {
            model.addAttribute("user_login", newUser.getLogin());
            model.addAttribute("user_id", user.getUserId());
            model.addAttribute("error", messageSource.getMessage("error.resetPage.samePasswords", null, null));
            return "reset";
        }
        passwordEncoder = new BCryptPasswordEncoder();
        if (passwordEncoder.matches(newUser.getPassword(), user.getPassword())) {
            model.addAttribute("user_login", newUser.getLogin());
            model.addAttribute("user_id", user.getUserId());
            model.addAttribute("error_password", messageSource.getMessage("error.resetPage.previousPassword", null, null));
            return "reset";
        }

        user.setPassword(passwordEncoder.encode(newUser.getPassword()));
        user.setPassword2(null);
        userRepository.editUser(user);
        model.addAttribute("message", messageSource.getMessage("info.loginPage.passwordReset", null, null));
        model.addAttribute("newUser", user);
        return "login";
    }

}
