package ua.f13group.KnowHub.service.jpaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.repository.UserRepository;
import ua.f13group.KnowHub.service.MailService;
import ua.f13group.KnowHub.service.UserService;

@Service
public class JpaUserService implements UserService{

    @Autowired
    private UserRepository userRepository;
    
    @Autowired 
    private MailService mailService; 
    
    @Override
    @Transactional
    public Integer saveUser(User user) {
    	
    	// Hardcoded subject  and text of e-mail
    	String subject = "Registration confirmation"; 
    	    	
    	if(userRepository.saveUser(user) !=null ){
    		user.setLink(user.getLogin().hashCode()+""+user.getUserId());
    		String text = "Thank you for joining KnowHub! To get started, you need to verify your email address. Please go to the link below and log in: \n\r";
    		text += ("http://localhost:8080/KnowHub/confirmation/" + user.getLink());
    		
    		mailService.sendMail(user.getLogin(), subject, text);
    	}
        return user.getUserId().intValue();
    }
    @Transactional
	@Override
	public Integer confirmUser(String userlink) {
			User user = userRepository.getUserByLink(userlink);
			user.setConfirmed(true);
		return user.getUserId().intValue();
	}
    
}
