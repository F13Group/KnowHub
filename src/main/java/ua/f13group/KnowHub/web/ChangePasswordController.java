package ua.f13group.KnowHub.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ua.f13group.KnowHub.domain.Confirmation;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.repository.UserRepository;

@Controller
public class ChangePasswordController {

	private static final int CHANGE_PASS_EXPIRATION_PERIOD = 24 * 60 * 60 * 1000;
	
	@Autowired
	UserRepository userRepository;
	
	@RequestMapping(value = "/restore_password/{generatedLink}")
	public User checkReceivedLink (@PathVariable String generatedLink){
		Confirmation confirmation = userRepository.getRestorePassByLink(generatedLink);
		if (confirmation == null){
			return null;
		}
		else {
			if (confirmation.getRegDate().getTime() + CHANGE_PASS_EXPIRATION_PERIOD > System.currentTimeMillis()){
				return confirmation.getUser();
			}
		}
		return null;
	}
	
}
