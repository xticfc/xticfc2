package com.xticfc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.xticfc.dto.UserDto;
import com.xticfc.service.UserService;
import com.xticfc.util.StringUtil;

@RequestMapping("/jpaginate")
@Controller
public class JpaginateController {

	private UserService userService;
	
	
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		List<UserDto> userList = userService.list(1, 7, null);
		int count = userService.count();
		request.setAttribute("pageNum", StringUtil.getPageNum(count, 7));
		return "views/jpaginate/index";
	}
	
	@RequestMapping(value="/list")
	public String list(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		int start = ServletRequestUtils.getIntParameter(request, "start", 0);
		int size = ServletRequestUtils.getIntParameter(request, "size", 7);
		
		List<UserDto> userList = userService.list(start, size, null);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		StringUtil.writeToWeb(gson.toJson(userList), "json", response);
		return null;
	}
	
	
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
