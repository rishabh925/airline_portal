package bean;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;


public class EmailSender {
	    private static String USER_NAME = "risgulati";  // GMail user name (just the part before "@gmail.com")
	    private static String PASSWORD = "PassWord1."; // GMail password
	    private static String RECIPIENT = "cgulati77@gmail.com";
	    
	    public  void setReciever(String recv)
	    {
	    
	    	RECIPIENT = recv;
	    }
	  
	    public  void main(String[] args) {
	        String from = USER_NAME;
	        String pass = PASSWORD;
	       
	        String[] to = { RECIPIENT }; // list of recipient email addresses
	        String subject = "Java sent mail";
	        String new_pass = PasswordGenerator.create_Password();
	        String body = "Welcome to JavaMail! Your new password is " + new_pass;
	        System.out.println("password has been set to" + new_pass);

	        sendFromGMail(from, pass, to, subject, body);
	    }

	    private static void sendFromGMail(String from, String pass, String[] to, String subject, String body) {
	    	Properties props = System.getProperties();
	        String host = "smtp.gmail.com";
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.user", from);
	        props.put("mail.smtp.password", pass);
	        props.put("mail.smtp.port", "587");
	        props.put("mail.smtp.auth", "true");

	        Session session = Session.getDefaultInstance(props);
	        MimeMessage message = new MimeMessage(session);

	        try {
	            message.setFrom(new InternetAddress(from));
	            InternetAddress[] toAddress = new InternetAddress[to.length];

	            // To get the array of addresses
	            for( int i = 0; i < to.length; i++ ) {
	                toAddress[i] = new InternetAddress(to[i]);
	            }

	            for( int i = 0; i < toAddress.length; i++) {
	                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
	            }

	            message.setSubject(subject);
	            message.setText(body);
	            Transport transport = session.getTransport("smtp");
	            transport.connect(host, from, pass);
	            transport.sendMessage(message, message.getAllRecipients());
	            transport.close();
	        }
	        catch (AddressException ae) {
	        	System.out.println("bhaiya yaha to address hi galat aa ra he" + RECIPIENT);
	            ae.printStackTrace();
	        }
	        catch (MessagingException me) {
	        	System.out.println("aur yaha msg nahi aa r aha" + RECIPIENT);
	            me.printStackTrace();
	        }
	    }
	}

