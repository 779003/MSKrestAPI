package com.mskim.backendservice.common.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.mskim.frontendService.apps.service.AppsService;

public class ApiInterceptor extends HandlerInterceptorAdapter {

	static final int ADMIN = 1;
	static final int USER = 2;

	@Autowired
	AppsService appsService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HandlerMethod method = (HandlerMethod) handler;	
		String apiKey = request.getHeader("Apikey");
		String methodName = method.getMethod().getName();
		
		if(apiKey == null){
			response.sendRedirect("/error/2005");
			return false;
		}
		
		int userType = appsService.getPermissionByApiKey(apiKey);
		String requestMethod = request.getMethod();
		
		

		if (userType == ADMIN) {
			return true;
		} else {

			if (requestMethod.equals("GET")) {

				if (methodName.equals("selectMembers") || methodName.equals("selectMember")) {
					response.sendRedirect("/error/403");
					return false;
					
				} else {
					return true;
				}

			} else {
				response.sendRedirect("/error/403");
				return false;
			}

		}

	}
}
