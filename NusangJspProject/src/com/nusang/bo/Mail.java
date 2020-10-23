package com.nusang.bo;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {

	static final String FROM = "tmdghks7836@naver.com";
	static final String FROMNAME = "지오서비스";
	static final String TO = "tmdghks7836@naver.com";
	static final String SMTP_USERNAME = "tmdghks7836";
	static final String SMTP_PASSWORD = "vkfl4521687!";

	static final String HOST = "smtp.naver.com";
	static final int PORT = 587;

	static final String SUBJECT = "메일 제목";

	static final String BODY = String.join(System.getProperty("line.separator"), "<h1>메일 내용</h1>",
			"<p>이 메일은 아름다운 사람이 보낸 아름다운 메일입니다!</p>.");

	public void sendMail() {

		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.port", PORT);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.naver.com");
		Session session = Session.getDefaultInstance(prop);
		MimeMessage msg = new MimeMessage(session);
		Transport transport = null;
		try {
			msg.setFrom(new InternetAddress(FROM, FROMNAME));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
			msg.setSubject(SUBJECT);
			msg.setContent(BODY, "text/html;charset=euc-kr");

			transport = session.getTransport();
			System.out.println("Sending...");

			transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
			transport.sendMessage(msg, msg.getAllRecipients());
			System.out.println("Email sent!");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				transport.close();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
