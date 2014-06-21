package com.xticfc.inteceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xticfc.entity.User;
import com.xticfc.util.Constants;

/**
 * 权限控制
 * @author xticfc
 *
 */
public class PermissionsInteceptor implements HandlerInterceptor {

	
	/**
	 * 最后被触发
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
//		System.out.println("================after");

	}

	/**
	 * 在Controller内的方法执行后，到达VIEW以前执行本方法。
	 */
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
//		System.out.println("==================last");
	}

	/**
	 * 在Controller内的方法执行前执行本方法，用来做权限验证。
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		String path = request.getServletPath();
		User user = (User) request.getSession().getAttribute("user");
		if (user == null && !(path.startsWith("/login/"))) {
			request.setAttribute("errorMessage", "您还没有登录或者登录超时，请登录！");
			response.sendRedirect(request.getContextPath() + "/system/main.jsp");
			return false;
		}
		return true;
	}

	
	/**
	 * 计算是否已经超时
	 * @param old
	 * @return
	 */
	public boolean isTimeOut(long old){
		long now = new Date().getTime();		//当前时间的毫秒数
		long maxTime = Long.parseLong(Constants.get("SessionOutTime"));	//配置文件config.properties中记录的超时时间，以秒为单位
		if(now - old > maxTime*1000){
			return true;
		}else{
			return false;
		}
	}
	
	

}
