package com.xticfc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Param;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.xticfc.entity.User;
import com.xticfc.service.UserService;
import com.xticfc.util.DateUtil;
import com.xticfc.util.StringUtil;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	UserService userService;

	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		return "/views/user/index";
	}
	
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		int start = ServletRequestUtils.getIntParameter(request, "page", 1)-1;
		int size = ServletRequestUtils.getIntParameter(request, "pagesize", 0);
		String name = ServletRequestUtils.getStringParameter(request, "name", "");
		String status = ServletRequestUtils.getStringParameter(request, "status", "");
		String order = StringUtil.getOrderString(request);	//取得排序参数
		
		List<User> list = userService.list(name,status,start, size, order);
		int count = userService.countAirCount(name,status);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("result", list);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String s = gson.toJson(map);
		s = StringUtil.treatJson(s);
		StringUtil.writeToWeb(s, "JSON", response);
		return null;
	}
	
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String id = ServletRequestUtils.getStringParameter(request, "id", "");
		
		if(null != id){
			userService.delete(id);
		}
		return "redirect:/user/index?clientType=web";
	}
	
	@RequestMapping(value = "/gotoModify")
	public String gotoModify(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String id = ServletRequestUtils.getStringParameter(request, "id", "");
		User user = userService.get(id);
		request.setAttribute("user", user);
		return "/views/user/modify";
	}
	
	@RequestMapping(value = "/modify")
	public String modify(HttpServletRequest request,
			HttpServletResponse response, @Param User user) throws Exception{
		String id = ServletRequestUtils.getStringParameter(request, "id", "");
		User user1 = userService.get(id);
		String result = "{\"result\":\"失败，未查询到所操作的对象\"}";;
		if(null != user1){
			BeanUtils.copyProperties(user, user1);
			userService.update(user1);
			result = "{\"result\":\"成功\"}";
		}
		StringUtil.writeToWeb(result, "json", response);
		return null;
	}
	
	
	@RequestMapping(value = "/gotoAdd")
	public String gotoAdd(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		return "/views/user/add";
	}
	
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request,
			HttpServletResponse response,@Param User user) throws Exception{
		user.setRegistTime(DateUtil.getSqlDate());
		userService.save(user);
		String result = "{\"result\":\"成功\"}";
		StringUtil.writeToWeb(result, "json", response);
		return null;
	}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
}
