package com.sathya.servlet;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EmailServiceServlet")
public class EmailServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	final String senderEmailId = "mdebashis46@gmail.com";
	final String senderPassword = "tmuo agye kuaa cuja";
	final String emailSMTPserver = "smtp.gmail.com";
	final String emailServerPort = "465";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String receiverEmailId = (String)request.getAttribute("receiverEmail");
		String emailBody = (String) request.getAttribute("emailBody");
		String emailSubject = (String) request.getAttribute("emailSubject");
		
		Properties props = new Properties();
		props.put("mail.smtp.user", senderEmailId);
		props.put("mail.smtp.host", emailSMTPserver);
		props.put("mail.smtp.port", emailServerPort);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", emailServerPort);
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");

		try {
			SMTPAuthenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(props, auth);
			MimeMessage msg = new MimeMessage(session);
			msg.setText(emailBody);
			msg.setSubject(emailSubject);
			msg.setFrom(new InternetAddress(senderEmailId));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmailId));
			Transport.send(msg);
			System.out.println("Message Sent Successfully");

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	public class SMTPAuthenticator extends Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(senderEmailId, senderPassword);
		}
	}

}
