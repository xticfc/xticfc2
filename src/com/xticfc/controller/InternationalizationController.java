package com.xticfc.controller;

import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;

import com.xticfc.util.InternetUtil;

  
@Controller
@RequestMapping(value="/internationalization")
public class InternationalizationController {  
	LocaleResolver localeResolver;
	
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String ip = InternetUtil.getIp(request);
		request.setAttribute("ip", ip);
		Locale locale = localeResolver.resolveLocale(request);
//		localeResolver.setLocale(request, response, Locale.US);
		
		return "views/internationalization/index";
	}
	

	public LocaleResolver getLocaleResolver() {
		return localeResolver;
	}

	public void setLocaleResolver(LocaleResolver localeResolver) {
		this.localeResolver = localeResolver;
	}
}  