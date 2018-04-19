package com.mskim.backendservice.common.api;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mskim.backendservice.aquarium.service.AquariumService;
import com.mskim.backendservice.fish.service.FishService;
import com.mskim.backendservice.member.service.MemberService;
import com.mskim.frontendService.apps.service.AppsService;

public class ApiInterceptor extends HandlerInterceptorAdapter {

	static final int ADMIN = 1;
	static final int USER = 2;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	FishService fishService;
	
	@Autowired
	AquariumService aquariumService;

	@Autowired
	AppsService appsService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		/*
		 * API 호출 이전 유효성 검사
		 * 
		 * 1. API Key null 체크
		 * 2. 버전 정보 null 체크
		 * 3. 유저 및 API Key 유효성 체크, 허용URL체크
		 * 4. 유저 권한 체크
		 * */
		Map<?, ?> pathVariable = (Map<?, ?>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
		String[] urlSplit = request.getRequestURI().split("/");
		HandlerMethod method = (HandlerMethod) handler;	
		String apiKey = request.getHeader("Apikey");
		String methodName = method.getMethod().getName();
		String requestVersion = pathVariable.get("version").toString();
		String apiName = urlSplit[3];
		String apiSeq = "0";
		int remainingViews = 0;
		String requestMethod = request.getMethod();
		String requestURL = request.getMethod() + "(" + request.getMethod() + ")";
		
		/* 1. API Key null 체크 */
		if(apiKey == null){
			response.sendRedirect("/error/2005?api="+apiSeq);
			return false;
		}		
		
		/* 2. 버전 정보 null 체크 */
		if (requestVersion == null) {
			response.sendRedirect("/error/3001?api=" + apiSeq + "&url=" + requestURL);
			return false;
		}
		
		/* 3. 유저 및 API Key 유효성 체크, 허용URL체크 */
		if ("member".equals(apiName)) {
			apiSeq = "1";
			remainingViews = memberService.validityCheck(apiKey, apiSeq, request.getHeader("referer"));

		} else if ("fish".equals(apiName)) {
			apiSeq = "2";
			remainingViews = fishService.validityCheck(apiKey, apiSeq, request.getHeader("referer"));

		} else if ("aquariums".equals(apiName)) {
			apiSeq = "3";
			remainingViews = aquariumService.validityCheck(apiKey, apiSeq, request.getHeader("referer"));
		}
		
		if (requestMethod.equals("GET")) {
			if (remainingViews == 0) {
				response.sendRedirect("/error/1003?api=" + apiSeq + "&url=" + requestURL);
				return false;
			}
		}
		
		if (remainingViews < 0) { // 결과가 음수일 경우 코드값
			int codeNumber = Math.abs(remainingViews);
			response.sendRedirect("/error/" + codeNumber + "?api=" + apiSeq + "&url=" + requestURL);
			return false;
		}
		
		/* 4. 유저 권한 체크 */
		int userType = appsService.getPermissionByApiKey(apiKey);
		if (userType == USER) {
			
			if(! requestMethod.equals("GET")) {
				response.sendRedirect("/error/403?api="+apiSeq + "&url=" + requestURL);
				return false;
			}			
			if( requestMethod.equals("GET") && (methodName.equals("selectMembers") || methodName.equals("selectMember"))) {
				response.sendRedirect("/error/403?api="+apiSeq + "&url=" + requestURL);
				return false;
			}
		}
		
		return true;
	}
	

}
