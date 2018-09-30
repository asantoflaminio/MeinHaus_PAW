package ar.edu.itba.paw.services;

import java.io.File;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
		final String html = "<!DOCTYPE html><html><body>"
				+ "<p><b>This is an automatic sent email. Please do not replay</b></p>" 
				+ "<p><b>Contact email: </b></p><p>"+ email +"</p>"
				+ "<p>Message:</p>"
				+ "<p>"+ message +"</p>"
				+ "</body>"
				+ "</html>";

		return html;
		
	}
	
	
	public void sendEmail(String to, String body) throws AddressException, MessagingException {
		String message = prepareMessage(body,to);
		
		MimeMessage email = mailSender.createMimeMessage();
		
		email.setSubject("Contact message");
		email.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
		email.setContent(message, "text/html; charset=utf-8");
		
		mailSender.send(email);
	}
 
}