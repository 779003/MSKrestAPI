package com.mskim.backendservice.common.errorpage.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mskim.backendservice.common.log.interceptor.LogInterceptor;
import com.mskim.backendservice.common.log.service.LogService;
import com.mskim.backendservice.common.log.vo.LogVo;

public class ErrorPageInterceptor extends HandlerInterceptorAdapter{

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
		String apiSeq = request.getParameter("api");
		String apiKey = request.getHeader("Apikey");
		String[] urlSplit = request.getRequestURI().split("/");
		String errorCode = urlSplit[2];
		String requestUrl = request.getParameter("url");
		apiSeq = apiSeq == null ? "UNKNOWN" : apiSeq;
		apiKey = apiKey == null ? "UNKNOWN" : apiKey;
		requestUrl = requestUrl == null ? "UNKNOWN" : requestUrl;
		LogVo logInfo;

		logger.info("[Returned ErrorPage] ===================================================");

		if (apiSeq != null) {
			logger.info("| API Seq : " + apiSeq);
		}

		if (errorCode != null) {
			logger.info("| Error code : " + errorCode);
		}
		
		if (request.getRemoteHost() != null) {
			
			logger.info("| getRemoteHost : " + request.getRemoteHost());
		}

		logger.info("| requestUrl : " + requestUrl);
		
		logInfo = new LogVo(apiKey, apiSeq, "FAILURE", errorCode, "RETURN_ERROR");
		String useInfo = "| API KEY : " + logInfo.getApi_key();
		useInfo += ", Success? : " + logInfo.getSuccess();
		useInfo += ", Error Code : " + logInfo.getError_code();

		logger.info(useInfo);
		
		try {
			logService.insertLog(request, logInfo, requestUrl);
		} catch (Exception e) {
			e.printStackTrace();
		}

		logger.info("L take Time : " + takeTime + " ms ==============================================");
	}
}
