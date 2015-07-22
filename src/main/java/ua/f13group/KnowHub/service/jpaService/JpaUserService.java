package ua.f13group.KnowHub.service.jpaService;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ua.f13group.KnowHub.domain.Confirmation;
import ua.f13group.KnowHub.domain.User;
import ua.f13group.KnowHub.repository.UserRepository;
import ua.f13group.KnowHub.service.MailService;
import ua.f13group.KnowHub.service.PropertyService;
import ua.f13group.KnowHub.service.UserService;

@Service
public class JpaUserService implements UserService{

    @Autowired
    private UserRepository userRepository;
    
    @Autowired 
    private MailService mailService; 
    
    @Autowired
    private PropertyService propertyService;
    
    @Override
    @Transactional
    public Integer saveUser(User user) {
    	
    	user.setLogin(user.getLogin().trim().toLowerCase());
    	
    	// !!!!!!!!!!  Hardcoded subject  and text of e-mail
    	
    	String subject = "Registration confirmation"; 
    	    	
    	if(userRepository.saveUser(user) !=null ){
    		Confirmation confirmation = new Confirmation(user);
    		confirmation.setLink(user.getLogin().hashCode()+""+user.getUserId());
    		userRepository.saveConfirmation(confirmation);
    		String text = "Thank you for joining KnowHub! To get started, you need to verify your email address. Please go to the link below and log in: \n\r";
    		text += ("http://localhost:8080/KnowHub/confirmation/" + confirmation.getLink());
    		
    		//mailService.sendMail(user.getLogin(), subject, text);
    	}
        return user.getUserId().intValue();
    }
    
    @Transactional
	@Override
	public Integer confirmUser(String link) {
    	
    		Confirmation confirmation = userRepository.getConfirmationByLink(link);
			User user = confirmation.getUser();
			Long regTime = confirmation.getRegDate().getTime();
			long regTimeout = Integer.valueOf((propertyService.getProperty("reg_timeout"))) *60*60*1000 ;
			if(Calendar.getInstance().getTimeInMillis() > regTime + regTimeout ){
				
				return -1;
			}
							
			user.setConfirmed(true);
			userRepository.deleteConfirmation(confirmation);
		return user.getUserId().intValue();
	}
    
	@Override
	public User getUserByLogin(String login) {
		
		login =login.trim().toLowerCase();
		
		return userRepository.getUserByLogin(login);
	}
	
	@Transactional
	@Override
	public void updateUser(User newUser) {
		userRepository.deleteConfirmation(userRepository.getConfirmationByUserLogin(newUser.getLogin()));
		userRepository.deleteUser(userRepository.getUserByLogin(newUser.getLogin()));
		newUser.setUserId(null);
		saveUser(newUser);
	}
    
}
