package com.xticfc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/datePicker")
public class DatePickerController{

	

	@RequestMapping(value = "/index")
	public String doHandleRequestInternal(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		return "/views/datePicker/index";
			
	}


}
