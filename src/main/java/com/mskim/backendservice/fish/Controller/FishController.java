package com.mskim.backendservice.fish.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.mskim.backendservice.common.Code;
import com.mskim.backendservice.common.Version;
import com.mskim.backendservice.common.log.vo.LogVo;
import com.mskim.backendservice.fish.service.FishService;
import com.mskim.backendservice.fish.vo.FishVo;

@RestController
@RequestMapping(value = "/api/{version}")
public class FishController {
	
	static final String API_SEQ ="2";

	@Autowired
	FishService fishService;
	
	Gson gson = new Gson();
	
	@RequestMapping(value ="/fish", 
					method = RequestMethod.GET, 
					produces = "application/json; charset=utf8" )
	public String selectAllFish(@RequestHeader(value = "Apikey", required = false) String apikey, FishVo parameterVo,
			HttpServletRequest request,	HttpServletResponse response){
        
		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());

		if(apikey == null){
			
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return fishService.resultWithCode(Code.NO_APIKEY);

		}else if (requestVersion == null) {
			
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return fishService.resultWithCode(parameterVo, Code.NO_VERSION);
		}

		int viewsCount = fishService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
		if(viewsCount < 0){ //결과가 음수일 경우 코드값
			
			response.setStatus(HttpStatus.FORBIDDEN.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(Math.abs(viewsCount)).getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return fishService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			
		}else if(viewsCount == 0){
			
			response.setStatus(HttpStatus.FORBIDDEN.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.EXCEEDED_CALL.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return fishService.resultWithCode(Code.EXCEEDED_CALL);
		}else{
			LogVo logInfo;
			switch (requestVersion) {			
				case VERSION_1:
					logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
					request.setAttribute("logInfo", logInfo);					
					fishService.callCount(apikey);
					return gson.toJson(fishService.selectAllFish());
				
				default:
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);					
					response.setStatus(HttpStatus.BAD_REQUEST.value());
					return fishService.resultWithCode(parameterVo, Code.NO_VERSION);
			}
		}	
	}
	
	@RequestMapping(value ="/fish/{fish_name}", 
			method = RequestMethod.GET, 
			produces = "application/json; charset=utf8" )
	public String selectFish(@RequestHeader(value = "Apikey", required = false) String apikey, FishVo parameterVo,
			HttpServletRequest request,	HttpServletResponse response) {
		
		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());
		
		if(apikey == null){
					
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return fishService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return fishService.resultWithCode(parameterVo, Code.NO_VERSION);
			
		}

		int viewsCount = fishService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
		if(viewsCount < 0){ //결과가 음수일 경우 코드값
			
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(Math.abs(viewsCount)).getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return fishService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			
		}else if(viewsCount == 0){
			
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.EXCEEDED_CALL.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return fishService.resultWithCode(Code.EXCEEDED_CALL);
			
		}else{
			LogVo logInfo;
			
			switch (requestVersion) {
				case VERSION_1:						
					if (fishService.alreadyHasValue(parameterVo.getFish_name())) {
						
						logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
						request.setAttribute("logInfo", logInfo);
						fishService.callCount(apikey);
						return gson.toJson(fishService.selectFish(parameterVo.getFish_name()));					
						
					}else{
							
						logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_RESULT.getCode(), "API_USE");
						request.setAttribute("logInfo", logInfo);
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						return fishService.resultWithCode(parameterVo, Code.NO_RESULT_WITH_VALUE);
					}
			
				default:
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);
					response.setStatus(HttpStatus.NOT_FOUND.value());
					return fishService.resultWithCode(parameterVo, Code.NO_VERSION);
				}
		}
	}
	
	@RequestMapping(value ="/fish", 
			method = RequestMethod.POST, 
			produces = "application/json; charset=utf8", consumes = "application/json" )
	public String insertFish(@RequestHeader(value = "Apikey", required = false) String apikey, 
			FishVo parameterVo, @RequestBody FishVo fishVo,
			HttpServletRequest request,	HttpServletResponse response) {
		
		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());

		if(apikey == null){
			
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return fishService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return fishService.resultWithCode(parameterVo, Code.NO_VERSION);
			
		}else{
			
			int viewsCount = fishService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
			if(viewsCount < 0){ //결과가 음수일 경우 코드값
				response.setStatus(HttpStatus.FORBIDDEN.value());
				LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(Math.abs(viewsCount)).getCode(), "API_USE");
				request.setAttribute("logInfo", logInfo);
				return fishService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			}
			
			LogVo logInfo;
			
			switch (requestVersion) {
			
				case VERSION_1:					
					logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
					request.setAttribute("logInfo", logInfo);
					fishService.insertFish(fishVo);
					response.setStatus(HttpStatus.CREATED.value());
					return fishService.resultWithCode(fishVo, Code.INSERT);
					
				default:
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);
					response.setStatus(HttpStatus.NOT_FOUND.value());
					return fishService.resultWithCode(parameterVo, Code.NO_VERSION);
			}
		}
	}
	
	@RequestMapping(value ="/fish/{fish_seq}", 
			method = RequestMethod.DELETE, 
			produces = "application/json; charset=utf8" )
	public String deleteFish(@RequestHeader(value = "Apikey", required = false) String apikey, FishVo parameterVo,
			HttpServletRequest request,	HttpServletResponse response) {

		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());

		if(apikey == null){
			
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return fishService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return fishService.resultWithCode(parameterVo, Code.NO_VERSION);
			
		}else{
			
			int viewsCount = fishService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
			if(viewsCount < 0){ //결과가 음수일 경우 코드값
				response.setStatus(HttpStatus.FORBIDDEN.value());
				LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(Math.abs(viewsCount)).getCode(), "API_USE");
				request.setAttribute("logInfo", logInfo);
				return fishService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			}
			
			LogVo logInfo;
			switch (requestVersion) {			
				case VERSION_1:
					if (fishService.alreadyHasValue(parameterVo.getFish_seq())) {
						
						logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
						request.setAttribute("logInfo", logInfo);
						fishService.deleteFish(parameterVo.getFish_seq());
						return fishService.resultWithCode(parameterVo, Code.DELETE);
						
					} else {	
						logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VALUE_DELETE.getCode(), "API_USE");
						request.setAttribute("logInfo", logInfo);
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						return fishService.resultWithCode(parameterVo, Code.NO_VALUE_DELETE);
					}
					
				default:
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);
					response.setStatus(HttpStatus.NOT_FOUND.value());
					return fishService.resultWithCode(parameterVo, Code.NO_VERSION);
			}
		}
	}
	
	@RequestMapping(value ="/fish/{fish_seq}", 
			method = RequestMethod.PUT, 
			produces = "application/json; charset=utf8", consumes = "application/json" )
	public String updateFish(@RequestHeader(value = "Apikey", required = false) String apikey, 
			FishVo parameterVo, @RequestBody FishVo fishVo,
			HttpServletRequest request,	HttpServletResponse response) {

Version requestVersion = Version.getVersionByString(parameterVo.getVersion());
		
		if(apikey == null){
			
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return fishService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return fishService.resultWithCode(parameterVo, Code.NO_VERSION);
			
		}else{

			int viewsCount = fishService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
			if(viewsCount < 0){ //결과가 음수일 경우 코드값
				response.setStatus(HttpStatus.FORBIDDEN.value());
				LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(Math.abs(viewsCount)).getCode(), "API_USE");
				request.setAttribute("logInfo", logInfo);
				return fishService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			}
			
			if (!parameterVo.getFish_seq().equals(fishVo.getFish_seq())) {
				
				LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.BAD_REQUEST_1005.getCode(), "API_USE");
				request.setAttribute("logInfo", logInfo);
				response.setStatus(HttpStatus.BAD_REQUEST.value());
				return fishService.resultWithCode(fishVo, Code.BAD_REQUEST_1005);
			}
			
			LogVo logInfo;
			switch (requestVersion) {
			
				case VERSION_1:	
					if (fishService.alreadyHasValue(fishVo.getFish_seq())) {
						
						logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
						request.setAttribute("logInfo", logInfo);
						fishService.updateFish(fishVo);
						return fishService.resultWithCode(fishVo, Code.UPDATE);
						
					} else {
						
						logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VALUE_UPDATE.getCode(), "API_USE");
						request.setAttribute("logInfo", logInfo);
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						return fishService.resultWithCode(fishVo, Code.NO_VALUE_UPDATE);
					}
					
				default:
					
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);
					response.setStatus(HttpStatus.NOT_FOUND.value());
					return fishService.resultWithCode(parameterVo, Code.NO_VERSION);
				}
		}
	}
	
}
