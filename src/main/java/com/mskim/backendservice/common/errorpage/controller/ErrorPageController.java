package com.mskim.backendservice.common.errorpage.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.mskim.backendservice.common.Code;
import com.mskim.backendservice.common.errorpage.service.ErrorPageService;


@RestController
@RequestMapping(value="/error")
public class ErrorPageController{
	
	@Autowired
	ErrorPageService errorPageService;
	
	Gson gson = new Gson();
	
	@RequestMapping(value="/400", produces = "application/json; charset=utf8")
	public String badRequest(HttpServletResponse response){
		response.setStatus(HttpStatus.BAD_REQUEST.value());
		return errorPageService.resultWithCode(Code.BAD_REQUEST);		
	}
	
	@RequestMapping(value="/403", produces = "application/json; charset=utf8")
	public String Forbidden(HttpServletResponse response){
		response.setStatus(HttpStatus.FORBIDDEN.value());
		return errorPageService.resultWithCode(Code.FORBIDDEN);		
	}
	
	@RequestMapping(value="/404", produces = "application/json; charset=utf8")
	public String notPound(HttpServletResponse response){
		response.setStatus(HttpStatus.NOT_FOUND.value());
		return errorPageService.resultWithCode(Code.NOT_FOUND);		
	}
	
	@RequestMapping(value="/405", produces = "application/json; charset=utf8")
	public String methodNotAllowed(HttpServletResponse response){
		response.setStatus(HttpStatus.METHOD_NOT_ALLOWED.value());
		return errorPageService.resultWithCode(Code.METHOD_NOT_ALLOWED);		
	}
	
	@RequestMapping(value="/415", produces = "application/json; charset=utf8")
	public String unsupportedMediaType(HttpServletResponse response){
		response.setStatus(HttpStatus.UNSUPPORTED_MEDIA_TYPE.value());
		return errorPageService.resultWithCode(Code.UNSUPPORTED_MEDIA_TYPE);		
	}
	
	@RequestMapping(value="/500", produces = "application/json; charset=utf8")
	public String internalServerError(HttpServletResponse response){
		response.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
		return errorPageService.resultWithCode(Code.INTERNAL_SERVER_ERROR);		
	}
	
	@RequestMapping(value="/1003", produces = "application/json; charset=utf8")
	public String exceededCall(HttpServletResponse response){
		response.setStatus(HttpStatus.FORBIDDEN.value());
		return errorPageService.resultWithCode(Code.EXCEEDED_CALL);		
	}
	
	@RequestMapping(value="/2001", produces = "application/json; charset=utf8")
	public String invalidKey(HttpServletResponse response){
		response.setStatus(HttpStatus.FORBIDDEN.value());
		return errorPageService.resultWithCode(Code.INVALID_KEY);		
	}
	
	@RequestMapping(value="/2002", produces = "application/json; charset=utf8")
	public String noReferer(HttpServletResponse response){
		response.setStatus(HttpStatus.FORBIDDEN.value());
		return errorPageService.resultWithCode(Code.NO_REFERER);		
	}
	
	@RequestMapping(value="/2003", produces = "application/json; charset=utf8")
	public String notAllowed(HttpServletResponse response){
		response.setStatus(HttpStatus.FORBIDDEN.value());
		return errorPageService.resultWithCode(Code.NOT_ALLOWED);		
	}
	
	@RequestMapping(value="/2004", produces = "application/json; charset=utf8")
	public String badData(HttpServletResponse response){
		response.setStatus(HttpStatus.BAD_REQUEST.value());
		return errorPageService.resultWithCode(Code.BAD_DATA);		
	}
	
	@RequestMapping(value="/2005", produces = "application/json; charset=utf8")
	public String noApiKey(HttpServletResponse response){
		response.setStatus(HttpStatus.UNAUTHORIZED.value());
		return errorPageService.resultWithCode(Code.NO_APIKEY);		
	}
	
	@RequestMapping(value="/2006", produces = "application/json; charset=utf8")
	public String unknownKey(HttpServletResponse response){
		response.setStatus(HttpStatus.UNAUTHORIZED.value());
		return errorPageService.resultWithCode(Code.UNKNOWN_KEY);		
	}
	
	@RequestMapping(value="/3001", produces = "application/json; charset=utf8")
	public String noVersion(HttpServletResponse response){
		response.setStatus(HttpStatus.BAD_REQUEST.value());
		return errorPageService.resultWithCode(Code.NO_VERSION);		
	}
	
}
