package ua.f13group.KnowHub.service;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;


@Service
public class SendOnlyMailService implements MailService {
	
	@Autowired
	private PropertyService propertyService;
	

        @Override
	public boolean sendMail(String address, String subject, String text){
		Properties props = new Properties();
		props.put("mail.smtp.host", propertyService.getProperty("smtp_server"));
		props.put("mail.smtp.socketFactory.port", propertyService.getProperty("smtp_port"));
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", propertyService.getProperty("smtp_port"));
 
		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(propertyService.getProperty("smtp_user"),propertyService.getProperty("smtp_password"));
				}
			});
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(propertyService.getProperty("smtp_user")));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(address));
			message.setSubject(subject);
			message.setText(text);
 
			Transport.send(message);

                        return true;
 
		} catch (MessagingException e) {
			return false;
		}
		
		
	}
    
}