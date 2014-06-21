package com.xticfc.service;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.springframework.web.multipart.MultipartFile;

import com.xticfc.dao.UserDao;

public class UploadService extends BaseService{
	
	UserDao userDao;
	OrgService orgService;
	
	
	
	/**
	 * 接收上传的图片，存到服务器上
	 * @param mf
	 * @param realPath
	 * @return
	 * @throws Exception
	 */
	public String uploadImage(MultipartFile mf, String realPath) throws Exception{
		String result = "[{\"result\":\"false\"}]";
		byte[] bytes = new byte[4096];
		String fileName = mf.getOriginalFilename();
		String orgCode = "888888";
		File path_temp = new File(realPath + "files" + File.separator + orgCode + File.separator);
		if (!path_temp.exists()) {
			path_temp.mkdirs();
		}
		File file_temp = new File(path_temp + File.separator + fileName);
		if (!file_temp.exists()) {
			file_temp.createNewFile();
		}
		
		FileOutputStream fs = new FileOutputStream(file_temp);
		int v;
		InputStream is = mf.getInputStream();
        while ((v=is.read(bytes)) > 0) {
        	fs.write(bytes, 0, v);
        }
		is.close();
        fs.flush();
        fs.close();
        
		return result;
	}
	
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public OrgService getOrgService() {
		return orgService;
	}

	public void setOrgService(OrgService orgService) {
		this.orgService = orgService;
	}


	
}
