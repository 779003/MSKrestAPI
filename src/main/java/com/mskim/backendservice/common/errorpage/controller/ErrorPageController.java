package com.mskim.backendservice.common.errorpage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.mskim.backendservice.common.Code;
import com.mskim.backendservice.common.errorpage.service.ErrorPageService;


@Controller
@RequestMapping(value="/error")
public class ErrorPageController{
	
	@Autowired
	ErrorPageService errorPageService;
	
	Gson gson = new Gson();
	
	@ResponseBody
	@RequestMapping(value="/400", produces = "application/json; charset=utf8")
	public String badRequest(){
		return errorPageService.resultWithCode(Code.BAD_REQUEST_400);		
	}
	@ResponseBody
	@RequestMapping(value="/404", produces = "application/json; charset=utf8")
	public String notPound(){
		return errorPageService.resultWithCode(Code.NOT_FOUND);		
	}
	@ResponseBody
	@RequestMapping(value="/405", produces = "application/json; charset=utf8")
	public String methodNotAllowed(){
		return errorPageService.resultWithCode(Code.METHOD_NOT_ALLOWED);		
	}
	@ResponseBody
	@RequestMapping(value="/415", produces = "application/json; charset=utf8")
	public String unsupportedMediaType(){
		return errorPageService.resultWithCode(Code.UNSUPPORTED_MEDIA_TYPE);		
	}
	
	@ResponseBody
	@RequestMapping(value="/500", produces = "application/json; charset=utf8")
	public String internalServerError(){
		return errorPageService.resultWithCode(Code.INTERNAL_SERVER_ERROR);		
	}
	@ResponseBody
	@RequestMapping(value="/9001", produces = "application/json; charset=utf8")
	public String badData(){
		return errorPageService.resultWithCode(Code.BAD_DATA);		
	}
	
}
