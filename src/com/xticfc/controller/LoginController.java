package com.xticfc.controller;



import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xticfc.entity.User;
import com.xticfc.service.SysService;
import com.xticfc.util.Constants;
import com.xticfc.util.StringUtil;
import com.xticfc.util.ValidateCode;


/**
 * 登录  登出
 * @author 
 *
 */
@Controller
@RequestMapping(value="/login")
public class LoginController {

	SysService sysService;


	
	
	
	
	
	
	@RequestMapping(value = "/webLogin", method=RequestMethod.POST)
	public String webLogin(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String username = ServletRequestUtils.getStringParameter(request, "username", "");
		String password = ServletRequestUtils.getStringParameter(request, "password", "");
		String identificationCode = ServletRequestUtils.getStringParameter(request, "identificationCode", "");
		String localIdentificationCode = (String)request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if(!localIdentificationCode.equals(identificationCode)){
			String result = "{\"success\":false,\"msg\":\"验证码不正确\"}";
			StringUtil.writeToWeb(result, "json", response);
			return null;
		}
		User user = sysService.webLogin(username, password);
		if(null == user){
			String result = "{\"success\":false,\"msg\":\"用户名或密码错误\"}";
			StringUtil.writeToWeb(result, "json", response);
			return null;
		}else{
			request.getSession().setAttribute("user", user);
			String result = "{\"success\":true,\"msg\":\"\"}";
			StringUtil.writeToWeb(result, "json", response);
			return null;
		}
	}
	@RequestMapping(value = "/getKaptchaImage")
	public String getKaptchaImage(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		 HttpSession session = request.getSession();  
          
        response.setDateHeader("Expires", 0);  
          
        // Set standard HTTP/1.1 no-cache headers.  
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
          
        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).  
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
          
        // Set standard HTTP/1.0 no-cache header.  
        response.setHeader("Pragma", "no-cache");  
          
        // return a jpeg  
        response.setContentType("image/jpeg");  
          
        ServletOutputStream out = response.getOutputStream();  
          
        ValidateCode vCode = new ValidateCode();  
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, vCode.getCode());  
        
        // write the data out  
        ImageIO.write(vCode.getBuffImg(), "jpg", out);
        try {  
            out.flush();  
        }catch (IOException e) {
			e.printStackTrace();
		}finally {  
            out.close();  
        }  
        return null;  
	}
	
	
	@RequestMapping(value = "/webLogout")
	public String webLogout(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath() + "/system/main.jsp");
		return null;
	}
	
	
	public SysService getSysService() {
		return sysService;
	}
	
	public void setSysService(SysService sysService) {
		this.sysService = sysService;
	}


}
