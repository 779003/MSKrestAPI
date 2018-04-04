package com.mskim.backendservice.aquarium.controller;

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
import com.mskim.backendservice.aquarium.service.AquariumService;
import com.mskim.backendservice.aquarium.vo.AquariumVo;
import com.mskim.backendservice.common.Code;
import com.mskim.backendservice.common.Version;
import com.mskim.backendservice.common.log.vo.LogVo;

@RestController
@RequestMapping(value="/api/{version}")
public class AquariumController {

	static final String API_SEQ ="3";

	@Autowired
	AquariumService aquariumService;
	
	Gson gson = new Gson();
	
	@RequestMapping(value="/aquariums", 
					method = RequestMethod.GET,
					produces = "application/json; charset=utf8")
	public String selectAquariums(@RequestHeader(value = "Apikey", required = false) String apikey, AquariumVo parameterVo,
								  HttpServletRequest request,	HttpServletResponse response) {

		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());

		if(apikey == null){
			
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return aquariumService.resultWithCode(Code.NO_APIKEY);

		}else if (requestVersion == null) {
			
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return aquariumService.resultWithCode(parameterVo, Code.NO_VERSION);
		}

		int viewsCount = aquariumService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
		if(viewsCount < 0){ //결과가 음수일 경우 코드값
			
			response.setStatus(HttpStatus.FORBIDDEN.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(Math.abs(viewsCount)).getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return aquariumService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			
		}else if(viewsCount == 0){
			
			response.setStatus(HttpStatus.FORBIDDEN.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.EXCEEDED_CALL.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return aquariumService.resultWithCode(Code.EXCEEDED_CALL);
		}else{
			LogVo logInfo;
			switch (requestVersion) {			
				case VERSION_1:
					logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
					request.setAttribute("logInfo", logInfo);					
					aquariumService.callCount(apikey);
					return gson.toJson(aquariumService.selectAquariums());
				
				default:
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);					
					response.setStatus(HttpStatus.BAD_REQUEST.value());
					return aquariumService.resultWithCode(parameterVo, Code.NO_VERSION);
			}
		}
	}
	
	@RequestMapping(value="/aquariums/{aquarium_seq}", 
					method = RequestMethod.GET,
					produces = "application/json; charset=utf8")
	public String selectAquarium(@RequestHeader(value = "Apikey", required = false) String apikey, AquariumVo parameterVo,
			HttpServletRequest request,	HttpServletResponse response) {
		
		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());
		
		if(apikey == null){
					
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return aquariumService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return aquariumService.resultWithCode(parameterVo, Code.NO_VERSION);
		}

		int viewsCount = aquariumService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
		if(viewsCount < 0){ //결과가 음수일 경우 코드값
			
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(Math.abs(viewsCount)).getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return aquariumService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			
		}else if(viewsCount == 0){
			
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.EXCEEDED_CALL.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return aquariumService.resultWithCode(Code.EXCEEDED_CALL);
			
		}else{
			LogVo logInfo;
			
			switch (requestVersion) {
				case VERSION_1:						
					if (aquariumService.alreadyHasValue(parameterVo.getAquarium_seq())) {
						
						logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
						request.setAttribute("logInfo", logInfo);
						aquariumService.callCount(apikey);
						return gson.toJson(aquariumService.selectAquarium(parameterVo.getAquarium_seq()));					
						
					}else{
							
						logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_RESULT.getCode(), "API_USE");
						request.setAttribute("logInfo", logInfo);
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						return aquariumService.resultWithCode(parameterVo, Code.NO_RESULT_WITH_VALUE);
					}
			
				default:
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);
					response.setStatus(HttpStatus.NOT_FOUND.value());
					return aquariumService.resultWithCode(parameterVo, Code.NO_VERSION);
				}
		}
	}
	
	@RequestMapping(value="/aquariums", 
					method = RequestMethod.POST,
					produces = "application/json; charset=utf8", consumes = "application/json")
	public String insertAquarium(@RequestHeader(value = "Apikey", required = false) String apikey, 
			AquariumVo parameterVo, @RequestBody AquariumVo aquariumVo,
			HttpServletRequest request,	HttpServletResponse response) {
		
		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());

		if(apikey == null){
			
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return aquariumService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return aquariumService.resultWithCode(parameterVo, Code.NO_VERSION);
			
		}else if(! aquariumService.dataMissingCheck(aquariumVo).equals("")) {
			
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.BAD_REQUEST_3005.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			
			String missingField = aquariumService.dataMissingCheck(aquariumVo);
			return aquariumService.resultWithCode(missingField, Code.BAD_REQUEST_3005);
			
		}else{
			
			int viewsCount = aquariumService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
			if(viewsCount < 0){ //결과가 음수일 경우 코드값
				response.setStatus(HttpStatus.FORBIDDEN.value());
				LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(Math.abs(viewsCount)).getCode(), "API_USE");
				request.setAttribute("logInfo", logInfo);
				return aquariumService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			}
			
			LogVo logInfo;
			
			switch (requestVersion) {
			
				case VERSION_1:					
					logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
					request.setAttribute("logInfo", logInfo);
					aquariumService.insertAquarium(aquariumVo);
					response.setStatus(HttpStatus.CREATED.value());
					return aquariumService.resultWithCode(aquariumVo, Code.INSERT);
					
				default:
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);
					response.setStatus(HttpStatus.NOT_FOUND.value());
					return aquariumService.resultWithCode(parameterVo, Code.NO_VERSION);
			}
		}
	}
	
	@RequestMapping(value="/aquariums/{aquarium_seq}", 
			method = RequestMethod.DELETE,
			produces = "application/json; charset=utf8")
	public String deleteAquarium(@RequestHeader(value = "Apikey", required = false) String apikey, AquariumVo parameterVo,
			HttpServletRequest request,	HttpServletResponse response) {
		
		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());

		if(apikey == null){
			
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return aquariumService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return aquariumService.resultWithCode(parameterVo, Code.NO_VERSION);
			
		}else{
			
			int viewsCount = aquariumService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
			if(viewsCount < 0){ //결과가 음수일 경우 코드값
				response.setStatus(HttpStatus.FORBIDDEN.value());
				LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(Math.abs(viewsCount)).getCode(), "API_USE");
				request.setAttribute("logInfo", logInfo);
				return aquariumService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			}
			
			LogVo logInfo;
			switch (requestVersion) {			
				case VERSION_1:
					if (aquariumService.alreadyHasValue(parameterVo.getAquarium_seq())) {
						
						logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
						request.setAttribute("logInfo", logInfo);
						aquariumService.deleteAquarium(parameterVo.getAquarium_seq());
						return aquariumService.resultWithCode(parameterVo, Code.DELETE);
						
					} else {	
						logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VALUE_DELETE.getCode(), "API_USE");
						request.setAttribute("logInfo", logInfo);
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						return aquariumService.resultWithCode(parameterVo, Code.NO_VALUE_DELETE);
					}
					
				default:
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);
					response.setStatus(HttpStatus.NOT_FOUND.value());
					return aquariumService.resultWithCode(parameterVo, Code.NO_VERSION);
			}
		}
	}
	
	@RequestMapping(value="/aquariums/{aquarium_seq}", 
					method = RequestMethod.PUT,
					produces = "application/json; charset=utf8", consumes = "application/json")
	public String updateAquarium(@RequestHeader(value = "Apikey", required = false) String apikey, 
			AquariumVo parameterVo, @RequestBody AquariumVo aquariumVo,
			HttpServletRequest request,	HttpServletResponse response) {
		
		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());
		
		if(apikey == null){
			
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return aquariumService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return aquariumService.resultWithCode(parameterVo, Code.NO_VERSION);
			
		}else if(! aquariumService.dataMissingCheck(aquariumVo).equals("")) {
			
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.BAD_REQUEST_3005.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			
			String missingField = aquariumService.dataMissingCheck(aquariumVo);
			return aquariumService.resultWithCode(missingField, Code.BAD_REQUEST_3005);
			
		}else{

			int viewsCount = aquariumService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
			if(viewsCount < 0){ //결과가 음수일 경우 코드값
				response.setStatus(HttpStatus.FORBIDDEN.value());
				LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(Math.abs(viewsCount)).getCode(), "API_USE");
				request.setAttribute("logInfo", logInfo);
				return aquariumService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			}
			
			if (!parameterVo.getAquarium_seq().equals(aquariumVo.getAquarium_seq())) {
				
				LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.BAD_REQUEST_3004.getCode(), "API_USE");
				request.setAttribute("logInfo", logInfo);
				response.setStatus(HttpStatus.BAD_REQUEST.value());
				return aquariumService.resultWithCode(aquariumVo, Code.BAD_REQUEST_3004);
			}
			
			LogVo logInfo;
			switch (requestVersion) {
			
				case VERSION_1:	
					if (aquariumService.alreadyHasValue(aquariumVo.getAquarium_seq())) {
						
						logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
						request.setAttribute("logInfo", logInfo);
						aquariumService.updateAquarium(aquariumVo);
						return aquariumService.resultWithCode(aquariumVo, Code.UPDATE);
						
					} else {
						
						logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VALUE_UPDATE.getCode(), "API_USE");
						request.setAttribute("logInfo", logInfo);
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						return aquariumService.resultWithCode(aquariumVo, Code.NO_VALUE_UPDATE);
					}
					
				default:
					
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);
					response.setStatus(HttpStatus.NOT_FOUND.value());
					return aquariumService.resultWithCode(parameterVo, Code.NO_VERSION);
				}
		}
	}
}

