package com.xticfc.service;

import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailService {
	private JavaMailSender sender;
	public void testSendMail() throws MessagingException{
		MimeMessage mm = sender.createMimeMessage();
		MimeMessageHelper mmh = new MimeMessageHelper(mm,false,"UTF-8");
		mmh.setText("内容");
		mmh.setSubject("标题");
		mmh.setTo("80508140@qq.com");
		mmh.setFrom("zzyzzy789@163.com");
		sender.send(mm);
	}
	
	public void testSendAttachementMail() throws MessagingException, IOException{
		MimeMessage mm = sender.createMimeMessage();
		MimeMessageHelper mmh = new MimeMessageHelper(mm, true, "utf-8");
		mmh.setCc("zzyzzy789@qq.com");
		mmh.setFrom("zzyzzy789@163.com");
		mmh.setTo("xticfc@163.com");
		mmh.setText("测试带附件邮件");
		mmh.setSubject("带附件标题");
//		ClassPathResource file = new ClassPathResource("aaa.txt");
//		mmh.addAttachment("aaa.zip", new File("D:/TDDOWNLOAD/jquery.jqGrid-4.5.2.zip"));
//		mmh.addAttachment("aaa.txt", file.getFile());
		sender.send(mm);
	}
	public JavaMailSender getSender() {
		return sender;
	}
	public void setSender(JavaMailSender sender) {
		this.sender = sender;
	}
}
