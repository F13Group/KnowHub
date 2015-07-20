package ua.f13group.KnowHub.service;

public interface MailService {
	
	public boolean sendMail(String address, String subject, String text);

}
