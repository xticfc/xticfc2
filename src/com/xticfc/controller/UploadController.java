package com.xticfc.controller;

import java.io.InputStream;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.xticfc.service.UploadService;

@Controller
@RequestMapping(value="/upload")
public class UploadController{

	UploadService uploadService;

		
		

	@RequestMapping(value = "/uploadImage")
	public String uploadImage(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		String id = ServletRequestUtils.getStringParameter(request, "sessionId", "");
		String tableName = ServletRequestUtils.getStringParameter(request, "tableName", "");
		String title = ServletRequestUtils.getStringParameter(request, "title", "");
		String description = ServletRequestUtils.getStringParameter(request, "description", "");
		String place = ServletRequestUtils.getStringParameter(request, "place", "");
		String longitude = ServletRequestUtils.getStringParameter(request, "longitude", "");
		String latitude = ServletRequestUtils.getStringParameter(request, "latitude", "");
		final String realpath = request.getSession().getServletContext().getRealPath("/");
		// 转型为MultipartHttpRequest：   
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;   
        // 获得文件：   
        MultipartFile file = null;
        Iterator<String> fileIter = multipartRequest.getFileNames();
        for(;fileIter.hasNext();){
        	file = multipartRequest.getFile(fileIter.next());   
        }
        // 获得输入流：   
        InputStream is = file.getInputStream();   
        
		return null;
	}
	
	
	public UploadService getUploadService() {
		return uploadService;
	}

	public void setUploadService(UploadService uploadService) {
		this.uploadService = uploadService;
	}






}
