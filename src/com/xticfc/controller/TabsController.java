package com.xticfc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/tabs")
@Controller
public class TabsController {

	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		return "views/tabs/index";
	}
}
