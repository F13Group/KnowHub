package ua.f13group.KnowHub.web;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.f13group.KnowHub.domain.User;

/*
 * Date of creation 19.10.2015
 * @author Dmytro Derzhevytskyi
 */

@Controller
public class LoginController extends AbstractSignUpController {

    private static final Logger logger = Logger.getLogger(LoginController.class);

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String signup(Model model,
                               @RequestParam(value = "logout", required = false) String logout,
                               @RequestParam(value = "error", required = false) String error) {

        addMessages(model);
        if (error != null) {
            model.addAttribute("error", messageSource.getMessage("error.loginpage.wrongLoginOrPassword", null, null));
        }

        if (logout != null) {
            model.addAttribute("message", messageSource.getMessage("info.loginpage.logoutSuccessful", null, null));
        }

        model.addAttribute("newUser", new User());
        return "login";
    }

    @RequestMapping(value = "/restore", method = RequestMethod.GET)
    public String restorePasswordPage() {

        return "restore";
    }
}