package com.xticfc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xticfc.service.MailService;

  
@Controller
@RequestMapping(value="/mail")
public class MailController {  
	
	private MailService mailService;
	
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
//		mailService.testSendMail();
		mailService.testSendAttachementMail();
		request.setAttribute("result", "邮件发送成功");
		return "views/mail/index";
	}
	public MailService getMailService() {
		return mailService;
	}
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	

}  