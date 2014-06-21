package com.xticfc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
  
@Controller
@RequestMapping(value="/map")
public class MapController {  
	
	
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		return "views/map/index";
	}
	

}  