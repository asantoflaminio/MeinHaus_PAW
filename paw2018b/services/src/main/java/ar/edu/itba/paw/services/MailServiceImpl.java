package ar.edu.itba.paw.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import ar.edu.itba.paw.MailService;
import ar.edu.itba.paw.models.Mail;

@Service()
public class MailServiceImpl implements MailService {
	
    @Autowired
    JavaMailSender mailSender;
 
    public void sendEmail(Mail mail) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(mail.getMailFrom());
        message.setTo(mail.getMailTo());
        message.setText(mail.getMailContent());
        mailSender.send(message);
    }

	public String prepareMessage(String message, String email) {
		final String initialMesssage = "This is an automatic sent email. Please do not replay";
		final String body = "Contact email: " + email + '\n' + '\n' + "Contact message:" + '\n' + message;
		return initialMesssage + '\n' + '\n' + body;
	}
 
}