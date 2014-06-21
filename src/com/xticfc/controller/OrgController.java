package com.xticfc.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.xticfc.entity.OrgTable;
import com.xticfc.entity.User;
import com.xticfc.service.OrgService;
import com.xticfc.util.StringUtil;

@Controller
@RequestMapping(value="/org")
public class OrgController{

	OrgService orgService;
	
	
	@RequestMapping(value = "/siteRelation")
	public String siteRelation(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String systemid = ServletRequestUtils.getStringParameter(request, "systemid", "");
		request.setAttribute("systemid", systemid);
		return "/views/ywxt/siteRelation";
	}
	
	
	
	
	@RequestMapping(value = "/getOrgTreeByUserFunc")
	public String getOrgTreeByUserLevel(HttpServletRequest request, HttpServletResponse response) throws Exception{
		User user = (User)request.getSession().getAttribute("user");
		String result = "{}";
		if(user != null){
			List<Map<String,Object>> orgTableList = orgService.getOrgTreeById(user.getSxId());
			if(null != orgTableList && orgTableList.size() > 0){
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
				result = gson.toJson(orgTableList);
			}
		}
		StringUtil.writeToWeb(result, "json", response);
		return null;
	}
	
	
	@RequestMapping(value = "/getSonOrgTreeByUserFunc")
	public String getSonOrgTreeByUserFunc(HttpServletRequest request, HttpServletResponse response) throws Exception{
		User user = (User)request.getSession().getAttribute("user");
		String id = ServletRequestUtils.getStringParameter(request, "id", "");
		if(id.length() == 0){
			id= user.getSxId();
		}
		String result = "";
		if(user != null){
			List<Map<String,Object>> orgTableList = orgService.getSonOrgTreeById(id,true);
			if(null != orgTableList && orgTableList.size() > 0){
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
				result = gson.toJson(orgTableList);
			}
		}
		StringUtil.writeToWeb(result, "json", response);
		return null;
	}
	
	
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		return "/views/org/index";
	}
	
	
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		int start = ServletRequestUtils.getIntParameter(request, "page", 1)-1;
		int size = ServletRequestUtils.getIntParameter(request, "pagesize", 0);
		String id = ServletRequestUtils.getStringParameter(request, "id", "");
		String status = ServletRequestUtils.getStringParameter(request, "status", "");
		String order = StringUtil.getOrderString(request);	//取得排序参数
		
		List<OrgTable> list = orgService.list(id,status,start, size, order);
		for (int i = 0; i < list.size(); i++) {
			OrgTable orgTable = list.get(i);
			if (!StringUtil.isNullOrSpace(orgTable.getParent())) {
				OrgTable porg = orgService.get(orgTable.getParent());
				if(porg!=null){
					orgTable.setParent(porg.getName());
				}
			}
		}
		int count = orgService.countOrgTable(id,status);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("result", list);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String s = gson.toJson(map);
		s = StringUtil.treatJson(s);
		StringUtil.writeToWeb(s, "JSON", response);
		return null;
	}

	@RequestMapping(value = "/gotoAdd")
	public String gotoAdd(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		return "/views/org/add";
	}
	
	
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest request,
			HttpServletResponse response, @Param OrgTable orgTable) throws Exception{
		OrgTable hasOrg=orgService.get(orgTable.getId());
		if(hasOrg!=null){
			String result = "{\"result\":\"ID不可用\"}";
			StringUtil.writeToWeb(result, "json", response);
			return null;
		}
		OrgTable porg=orgService.get(orgTable.getParent());
		int type =porg.getType()+1;
		orgTable.setType(type);
		orgService.save(orgTable);
		String result = "{\"result\":\"成功\"}";
		StringUtil.writeToWeb(result, "json", response);
		return null;
	}
	
	@RequestMapping(value = "/gotoModify")
	public String gotoModify(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String id = ServletRequestUtils.getStringParameter(request, "id", "");
		OrgTable orgTable = orgService.get(id);
		OrgTable porg=orgService.get(orgTable.getParent());
		request.setAttribute("OrgTable", orgTable);
		if(porg!=null){
			request.setAttribute("parent",porg.getId());
			request.setAttribute("parentName",porg.getName());
		}
		return "/views/org/modify";
	}
	
	@RequestMapping(value = "/modify")
	public String modify(HttpServletRequest request,
			HttpServletResponse response, @Param OrgTable orgTable) throws Exception{
		OrgTable hasOrg=orgService.get(orgTable.getId());
			if(hasOrg==null){
				String result = "{\"result\":\"失败\"}";
				StringUtil.writeToWeb(result, "json", response);
				return null;
			}
		OrgTable porg=orgService.get(orgTable.getParent());
		int type =porg.getType()+1;
		orgTable.setType(type);
		orgService.update(orgTable);
		String result = "{\"result\":\"成功\"}";
		StringUtil.writeToWeb(result, "json", response);
		return null;
	}
	
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String id = ServletRequestUtils.getStringParameter(request, "id", "");
		
		if(null != id){
			orgService.deleteOrg(id);
		}
		return "redirect:/org/index?clientType=web";
	}
	
	
	public OrgService getOrgService() {
		return orgService;
	}

	public void setOrgService(OrgService orgService) {
		this.orgService = orgService;
	}



}
