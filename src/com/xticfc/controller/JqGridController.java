package com.xticfc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xticfc.entity.Dinner;
import com.xticfc.service.DinnerService;
import com.xticfc.util.StringUtil;

  
@Controller
@RequestMapping(value="/jqGrid")
public class JqGridController {  
	
	DinnerService dinnerService;
	
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		return "views/jqGrid/index";
	}
	@RequestMapping(value="/list")
	public String list(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		int start = ServletRequestUtils.getIntParameter(request, "page", 1)-1;//当前页数，第1页会传1
		String nd = request.getParameter("nd");		//不清楚
		String _search = request.getParameter("_search");		//搜索
		int size = ServletRequestUtils.getIntParameter(request, "rows",0);//页面上要显示多少条记录
		String order = StringUtil.getOrderString(request);
		
		List<Dinner> list = dinnerService.list(start, size, order);
		int count = dinnerService.count();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("page", start+1);
		map.put("total", StringUtil.getPageNum(count, size));
		map.put("records", count);
		map.put("rows", list);
		JsonConfig jsonConfig = StringUtil.getJsonConfig();
		JSONArray j = JSONArray.fromObject(map, jsonConfig);
		String result = j.toString();
		result = result.substring(1, result.length()-1);
		StringUtil.writeToWeb(result, "json", response);
		return null;
	}
	public DinnerService getDinnerService() {
		return dinnerService;
	}
	public void setDinnerService(DinnerService dinnerService) {
		this.dinnerService = dinnerService;
	}
	

}  