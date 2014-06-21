package com.xticfc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.xticfc.entity.OrgTable;
import com.xticfc.service.OrgService;
import com.xticfc.service.TreeService;
import com.xticfc.util.StringUtil;

@Controller
@RequestMapping("/tree")
public class TreeController{

	private TreeService treeService;
	private OrgService orgService;
	

	

	@RequestMapping(value = "/index")
	public String show(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<OrgTable> list = orgService.list(OrgTable.class);
//		a(list);
		System.out.println(list);
		return "/views/tree/show";
	}

	
	public static void a(List<OrgTable> list){
		for(int i=0; i<list.size(); i++){
			b(list, list.get(i), null);
		}
	}
	public static void b(List<OrgTable> list, OrgTable o1, OrgTable o2){
		String id = o1.getId();
		OrgTable temp = null;
		boolean b = true;
		for(int i=0; i<list.size(); i++){
			temp = list.get(i);
			if(id.equals(temp.getParent())){
				b(list, o1, temp);
				b = false;
			}
		}
		if(b){
			o1.getChildren().add(o2);
			list.remove(o2);
			return ;
		}
	}
	@RequestMapping(value = "/getChildren")
	public String getChildren(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String id = ServletRequestUtils.getStringParameter(request, "id", "");
		if(id.length() == 0){
			id = "000000";
		}
		List<OrgTable> list = treeService.getChildren(id);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		StringUtil.writeToWeb(gson.toJson(list), "json", response);
		return null;
	}
	
	@RequestMapping(value = "/getAll")
	public String getAll(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String id = ServletRequestUtils.getStringParameter(request, "id", "");
		if(id.length() != 0){
			return null;
		}
		List<OrgTable> list = treeService.getAll();
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

	public OrgService getOrgService() {
		return orgService;
	}

	public void setOrgService(OrgService orgService) {
		this.orgService = orgService;
	}
}
