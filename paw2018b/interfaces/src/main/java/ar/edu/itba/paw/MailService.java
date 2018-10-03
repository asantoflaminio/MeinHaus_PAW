package ar.edu.itba.paw;

import ar.edu.itba.paw.models.Mail;

public interface MailService {
	public void sendEmail(Mail mail);
	
	public String prepareMessage (String message, String email, String info);

}
