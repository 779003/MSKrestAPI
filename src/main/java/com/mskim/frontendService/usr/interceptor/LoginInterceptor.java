package com.mskim.frontendService.usr.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.mskim.frontendService.usr.service.LoginService;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	LoginService loginService;
	 
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if (handler instanceof HandlerMethod) {
			
            HandlerMethod method = (HandlerMethod) handler;
            String methodName = method.getMethod().getName();
            String currUrl = "";
            if(methodName.equals("statsMain") || methodName.equals("statsDetail") ) {
            	currUrl= "/stats/main";
            }else if(methodName.equals("appRegisterPage")) {
            	currUrl= "/apps/register";
            }else {
            	currUrl= "/apps";
            }
            HttpSession session = request.getSession(false);
            
            if(session == null) {
            	response.sendRedirect("/usr/login?currUrl=" + currUrl);
            	return false;
            }
            
            if(loginService.getLoginMember(session) == null){
            	response.sendRedirect("/usr/login?currUrl=" + currUrl);
            	return false;
            }else {
            	return true;
            }
            
        }else {
        	response.sendRedirect("/error/400");
        	return false;
        }
	}
	
}
