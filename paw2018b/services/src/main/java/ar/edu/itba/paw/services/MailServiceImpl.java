package ar.edu.itba.paw.services;

import java.io.File;
import java.io.IOException;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.util.AlternativeJdkIdGenerator;

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
		    
							+ "<head>"
							+ "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />"
							+ "<link href=\"https://fonts.googleapis.com/css?family=Rubik\" rel=\"stylesheet\">"
							+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>"
							+ "</head>"
							
							+ "<body style=\"margin: 0;	padding: 0;\">"
							+	"<table style=\"border-spacing: 0; padding: 0; border: 0; width: 100%;\">"	
							+		"<tr>"
							+			"<td style=\"padding: 10px 0 30px 0;\">"
							+				"<table style=\"border: 1px solid #cccccc; border-collapse: collapse; width: 600px;	margin-left:auto; margin-right:auto; border-spacing: 0;	padding: 0;\">"
							+					"<tr>"
							+						"<td style=\"padding: 30px 0 30px 0; color: #153643; font-size: 28px; font-weight: bold; font-family: 'Rubik', sans-serif;\" align=\"center\" bgcolor=\"#ccc\" >"
							+							"<img style=\"display: block;\" src=\"http://i66.tinypic.com/30u8z8m.jpg\" alt=\"MeinHaus\" width=\"150\" height=\"50\"  />"
							+						"</td>"
							+					"</tr>"
							+					"<tr>"
							+						"<td bgcolor=\"#ffffff\" style=\"padding: 40px 30px 40px 30px;\">"
							+							"<table style=\"border-spacing: 0; padding: 0; border: 0; width: 100%;\">"
							+								"<tr>"
							+									"<td style=\"color: #153643; font-family: 'Rubik', sans-serif; font-size: 24px;\">"
							+										"<b>Te contactaron de MeinHaus!</b>"
							+									"</td>"
							+								"</tr>"
							+								"<tr>"
							+									"<td style=\"padding: 20px 0 10px 0; color: #153643; font-family: 'Rubik', sans-serif; font-size: 15px; line-height: 20px;\">"
							+										"Te llegó un mail de: "
							+										"<a href=\"#\" style=\"color:#FD8907; margin-left:5px;\">" + email + "</a>"
							+									"</td>"
							+								"</tr>"
							+								"<tr>"
							+									"<td style=\"padding: 5px 0 15px 0; color: #153643; font-family: 'Rubik', sans-serif; font-size: 15px; line-height: 20px;\">"
							+										"Con el siguiente mensaje:"
							+									"</td>"
							+								"</tr>"
							+								"<tr>"
							+									"<td style=\"font-style: italic; font-family: 'Rubik', sans-serif; color: #999; font-size: 15px;\">"
							+										message
							+									"</td>"
							+								"</tr>"
							+							"</table>"
							+						"</td>"
							+					"</tr>"
							+					"<tr>"
							+						"<td bgcolor=\"#FD8907\" style=\"padding: 30px 30px 30px 30px;\">"
							+							"<table style=\"border-spacing: 0; padding: 0; border: 0; width: 100%;\">"
							+								"<tr>"
							+									"<td style=\"color: #ffffff; font-family: 'Rubik', sans-serif; font-size: 14px;\" width=\"75%\">"
							+										"&reg; Meinhaus, 2018<br/>"
							+									"</td>"
							+								"</tr>"
							+							"</table>"
							+						"</td>"
							+					"</tr>"
							+				"</table>"
							+			"</td>"
							+		"</tr>"
							+	"</table>"
							+"</body>"
							+"</html>";

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