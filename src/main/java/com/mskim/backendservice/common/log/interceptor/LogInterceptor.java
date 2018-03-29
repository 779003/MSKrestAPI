package com.mskim.backendservice.common.log.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mskim.backendservice.common.log.service.LogService;
import com.mskim.backendservice.common.log.vo.LogVo;

public class LogInterceptor  extends HandlerInterceptorAdapter  {
	
	@Autowired
	LogService logService;
	
	private static final Logger logger = LoggerFactory.getLogger(LogInterceptor.class);
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		long startTime = System.currentTimeMillis();
		request.setAttribute("startTime", startTime);
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		long startTime = (Long) request.getAttribute("startTime");
		long endTime = System.currentTimeMillis();
		long takeTime = endTime - startTime;
		
		logger.info("[API CALLED] ==============================================");
		
		String logMessage = "";
		
		if(request.getRequestURI() != null) {
			logMessage += " RequestURI : " + request.getRequestURI();
			
			if(request.getQueryString() != null) {
				logMessage += "?" + request.getQueryString();
			}
			
		}
		if(request.getRemoteHost() != null) {
			logMessage += ", getRemoteHost : " + request.getRemoteHost();
		}
		if(request.getHeader("referer") != null) {
			logMessage += ", referer : " + request.getHeader("referer");
		}
		
		logger.info(logMessage);
	
		
		if(request.getAttribute("logInfo") == null) {
			
			logger.info("log info is null");
			
		}else {
			LogVo logInfo = (LogVo) request.getAttribute("logInfo");
			
			String useInfo = "USER : " + logInfo.getApi_key();
			useInfo += ", Success? : " + logInfo.getSuccess();
			
			if( "FAILURE".equals(logInfo.getSuccess())) {
				useInfo += ", Error Code : " + logInfo.getError_code();
			}
			
			logger.info(useInfo);
			
			try {
				logService.insertLog(request, logInfo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		logger.info("take Time : " + takeTime + " ms ==============================================");
		
	}

}
