package com.xticfc.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sun.xml.internal.ws.api.ha.HaInfo;
import com.xticfc.entity.Dinner;
import com.xticfc.util.StringUtil;


@Controller
@RequestMapping(value = "/json")
public class JsonController{


	private static Logger log = Logger.getLogger(JsonController.class);
	
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("id", 324234);
		map.put("name", "大跃进可要dksfh");
		map.put("date", new Date());
		map.put("boolean", false);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String result = gson.toJson(map);
		request.setAttribute("result", result);
		return "views/json/index";
	}
	public String list(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("id", 324234);
		map.put("name", "大跃进可要dksfh");
		map.put("date", new Date());
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String result = gson.toJson(map);
		StringUtil.writeToWeb(result, "json", response);
		return null;
	}
	
	
	
	
	
	



}
