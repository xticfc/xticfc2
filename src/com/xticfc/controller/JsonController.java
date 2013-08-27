package com.xticfc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.jboss.logging.Param;
import org.springframework.beans.factory.support.DefaultListableBeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xticfc.entity.Dinner;


@Controller
@RequestMapping(value = "/json")
public class JsonController{


	private static Logger log = Logger.getLogger(JsonController.class);
	
	@RequestMapping(value="/index")
	@ResponseBody
	public List index(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		return null;
	}
	
	
	
	
	
	



}
