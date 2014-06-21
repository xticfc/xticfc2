package com.xticfc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.xticfc.util.StringUtil;

@RequestMapping("/jqplot")
@Controller
public class JqplotController {

	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		return "views/jqplot/index";
	}
	
	
	@RequestMapping(value="/data1")
	public String data1(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		List<String> list = new ArrayList<String>();
		list.add("1");
		list.add("3");
		list.add("2");
		list.add("4");
		list.add("6");
		list.add("9");
		Gson gson = new GsonBuilder().create();
		StringUtil.writeToWeb(gson.toJson(list), "json", response);
		return null;
	}
}
