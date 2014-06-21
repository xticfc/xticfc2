package com.xticfc.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xticfc.entity.FuncSub;
import com.xticfc.entity.User;
import com.xticfc.service.FuncService;

@Controller
@RequestMapping(value = "/main")
public class MainController {

	FuncService funcService;

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		User user = (User)request.getSession().getAttribute("user");
		if(null != user){
			List<Map<String,Object>> result = funcService.getFuncs(user);
			request.setAttribute("funcs", result);
		}
		return "/views/main/index";
		
	}
	@RequestMapping(value = "/newIndex")
	public String newIndex(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		User user = (User)request.getSession().getAttribute("user");
		if(null != user){
			List<Map<String,Object>> result = funcService.getFuncs(user);
			request.setAttribute("funcs", result);
		}
		return "/views/main/newIndex";
		
	}
	
	
	@RequestMapping(value = "/top")
	public String top(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return "/views/main/top";
	}
	
	
	@RequestMapping(value = "/bottom")
	public String bottom(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return "/views/main/bottom";
	}
	
	
	@RequestMapping(value = "/center")
	public String center(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return "/views/main/center";
	}
	
	
	@RequestMapping(value = "/left")
	public String left(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		User user = (User)request.getSession().getAttribute("user");
		if(null != user){
			List<Map<String,Object>> result = funcService.getFuncs(user);
			request.setAttribute("funcs", result);
		}
		return "/views/main/left";
	}
	
	
	@RequestMapping(value = "/right")
	public String right(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String funcSubId = ServletRequestUtils.getStringParameter(request, "funcSubId", "");
		FuncSub funcSub = funcService.get(funcSubId);
		if(funcSubId.length() == 0){
			return "/views/main/welcome";
		}else{
			request.setAttribute("funcSub", funcSub);
			return "/views/main/right";
		}
	}
	
	
	@RequestMapping(value = "/weizhi")
	public String weizhi(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String funcSubId = ServletRequestUtils.getStringParameter(request, "funcSubId", "");
		FuncSub funcSub = funcService.get(funcSubId);
		request.setAttribute("funcSub", funcSub);
		return "/views/main/weizhi";
	}
	
	
	
	
	@RequestMapping(value = "/welcome")
	public String gotoWelcomePage(HttpServletRequest request, HttpServletResponse response){
		return "/views/system/welcome";
	}



	public FuncService getFuncService() {
		return funcService;
	}


	public void setFuncService(FuncService funcService) {
		this.funcService = funcService;
	}
}
