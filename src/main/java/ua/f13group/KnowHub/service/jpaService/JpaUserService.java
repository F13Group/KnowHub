package ua.f13group.KnowHub.service.jpaService;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ua.f13group.KnowHub.domain.Confirmation;
import ua.f13group.KnowHub.domain.ConfirmationType;
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
    
    private String letterSubjectRegistration = "Registration confirmation";
    
    private void createConfirmationAndSendConfirmationEmail(User user, String subject) {
    	// !!!!!!!!!!  Hardcoded subject  and text of e-mail
    	Confirmation confirmation = new Confirmation(user);
		confirmation.setLink(user.getLogin().hashCode()+""+user.getUserId());
		confirmation.setConfirmationType(ConfirmationType.conf);
		userRepository.saveConfirmation(confirmation);
		String text = "Thank you for joining KnowHub! To get started, you need to verify your email address. Please go to the link below and log in: \n\r";
		text += ("http://epuakyiw1793t6.kyiv.epam.com:8085/knowhub/confirmation/" + confirmation.getLink());
		//text += ("http://localhost:8085/knowhub/confirmation/" + confirmation.getLink());
		
		mailService.sendMail(user.getLogin(), subject, text);
    }
    
    @Override
    @Transactional
    public Integer saveUser(User user) {
    	
    	user.setLogin(user.getLogin().trim().toLowerCase());    	 
    	    	
    	if (userRepository.saveUser(user) != null){
    		createConfirmationAndSendConfirmationEmail(user, letterSubjectRegistration);
    	}
        return user.getUserId().intValue();
    }
    
    @Transactional
	@Override
	public Integer confirmUser(String link) {
    		
    	Confirmation confirmation = userRepository.getConfirmationByLink(link);
    	if (confirmation == null) {
    		return null;
    	}
    	User user = confirmation.getUser();
    	Long regTime = confirmation.getRegDate().getTime();
    	long regTimeout = Integer.valueOf((propertyService.getProperty("reg_timeout"))) *60*60*1000 ;
    	if (Calendar.getInstance().getTimeInMillis() > regTime + regTimeout ) {				
    		return null;
    	}

    	user.setConfirmed(true);
    	userRepository.deleteConfirmation(confirmation);
    	
		return user.getUserId().intValue();
	}
    
	@Override
	public User getUserByLogin(String login) {
		
		login = login.trim().toLowerCase();
		
		return userRepository.getUserByLogin(login);
	}
	
	@Transactional
	@Override
	public void updateUser(User newUser) {
		userRepository.deleteConfirmation(userRepository.getConfirmationByUserLogin(newUser.getLogin()));
		userRepository.editUser(newUser);
		createConfirmationAndSendConfirmationEmail(newUser, letterSubjectRegistration);
	}

	@Override
	public User getUserById(Long id) {
		return userRepository.getUserById(id);
	}
}
