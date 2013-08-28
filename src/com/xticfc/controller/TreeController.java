package com.xticfc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.xticfc.entity.OrgTable;
import com.xticfc.service.TreeService;
import com.xticfc.util.StringUtil;

@Controller
@RequestMapping("/tree")
public class TreeController{

	private TreeService treeService;
	

	@RequestMapping(value = "/index")
	public String show(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return "/views/tree/show";
	}

	@RequestMapping(value = "/getChildren")
	public String getChildren(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String id = ServletRequestUtils.getStringParameter(request, "id", "");
		if(id.length() == 0){
			id = "140000";
		}
		List<OrgTable> list = treeService.getChildren(id);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		StringUtil.writeToWeb(gson.toJson(list), "json", response);
		return null;
	}
	
	@RequestMapping(value = "/getAll")
	public String getAll(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<OrgTable> list = treeService.getAll("000000");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String result = gson.toJson(list);
		StringUtil.writeToWeb(result, "json", response);
		return null;
	}

	public TreeService getTreeService() {
		return treeService;
	}


	public void setTreeService(TreeService treeService) {
		this.treeService = treeService;
	}


}
