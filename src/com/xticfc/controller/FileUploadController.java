package com.xticfc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.xticfc.service.UploadService;
import com.xticfc.util.StringUtil;


@Controller
@RequestMapping(value = "/fileUpload")
public class FileUploadController{

	UploadService uploadService;
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return "/views/fileUpload/index";
	}
	
	@RequestMapping(value = "/upload")
	public String upload(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String someKey = ServletRequestUtils.getStringParameter(request, "someKey", "");
		int someOtherKey = ServletRequestUtils.getIntParameter(request, "someOtherKey", 0);
		String kkk = ServletRequestUtils.getStringParameter(request, "kkk", "");
		System.out.println(someKey);
		System.out.println(someOtherKey);
		System.out.println("kkk is :" + kkk);
		final String realPath = request.getSession().getServletContext().getRealPath("/");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest )request;
		List<MultipartFile> m = multipartRequest.getFiles("the_files");
		if(null != m && m.size() > 0){
			MultipartFile mf = m.get(0);
			uploadService.uploadImage(mf, realPath);
		}
		StringUtil.writeToWeb("测试测试测试", "html", response);
		return null;
	}
	
	@RequestMapping(value = "/download")
	public String download(HttpServletRequest request, HttpServletResponse response) throws Exception{
		final String realPath = request.getSession().getServletContext().getRealPath("/");
		File file = new File(realPath+File.separator+"files"+File.separator+"888888"+File.separator+"i1.jpg");
		InputStream is = new FileInputStream(file);
		byte[] data = IOUtils.toByteArray(is);
		response.setHeader("Content-Disposition", "attachment;fileName="+file.getName());
		response.addHeader("Content-Length", "" + data.length); 
		response.setContentType("application/octet-stream; charset=UTF-8");  
//		response.setHeader("Accept-Ranges", "bytes");//是否支持断点续传的标志，可是经迅雷测试无效果，还是提示资源不支持断点续传。
		IOUtils.write(data, response.getOutputStream());  
		IOUtils.closeQuietly(is);  
		return null;
	}
	public UploadService getUploadService() {
		return uploadService;
	}
	public void setUploadService(UploadService uploadService) {
		this.uploadService = uploadService;
	}





}
