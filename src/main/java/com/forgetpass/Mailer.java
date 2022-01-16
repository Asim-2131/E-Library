package com.forgetpass;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailer {
public static void send(String to,String subject,String msg){

	// Set User and pass of Email from which you want to sent mail
	
	final String user="elib.mgt@gmail.com";//change accordingly
	final String pass="elibasdf";
	
	
	// Set Properties like host,port,protocol, authentication
	Properties props = new Properties();
	props.setProperty("mail.smtp.host", "localhost");
	props.setProperty("mail.smtp.port", "587");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", "smtp.gmail.com");//change accordingly
	props.put("mail.smtp.auth", "true");
	
	//1st step) Get the session object	
	
	Session session = Session.getDefaultInstance(props,
		 new javax.mail.Authenticator() {
		  protected PasswordAuthentication getPasswordAuthentication() {
			  return new PasswordAuthentication(user,pass);
		   }
	});
	//2nd step)compose message
	try {
		
		// Mime Message is format of non-text email also able to sent audio, video, sheet etc.
		
		 MimeMessage message = new MimeMessage(session);
		 message.setFrom(new InternetAddress(user));
		 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
		 message.setSubject(subject);
		 message.setText(msg);
		 
		 //3rd step)send message
		 Transport.send(message);
		
		 System.out.println("Done");
		
		 } catch (MessagingException e) {
			 throw new RuntimeException(e);
		 }
		
	}
}