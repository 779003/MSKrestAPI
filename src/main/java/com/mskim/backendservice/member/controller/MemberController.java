package com.mskim.backendservice.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.mskim.backendservice.common.Code;
import com.mskim.backendservice.common.Version;
import com.mskim.backendservice.common.log.service.LogService;
import com.mskim.backendservice.member.service.MemberService;
import com.mskim.backendservice.member.vo.MemberVo;

/*
 * Produces와 Consumes 차이 : 
 * Produces는 Accept 헤더를 참고 
 * Consumes은 Content-Type 헤더를 참고
 * 출처 : http://www.mimul.com/pebble/default/2010/05/01/1272710220000.html
 * .
 * */

@RestController
@RequestMapping(value = "/{version}/admin")
public class MemberController{

	static final String API_SEQ ="1";

	/**
	 * {@link MemberService} 멤버 Service
	 */
	@Autowired
	MemberService memberService;
	
	@Autowired
	LogService logService;
		
	Gson gson = new Gson();
	
	/**
	 * 여러 멤버 조회 
	 * version1 - 모든 멤버 조회 
	 * version2 - 성별 구분 가능
	 * 
	 * @param memberVo
	 *            {@link MemberVo} 멤버 VO
	 * @return 멤버 목록
	 */
	
	@RequestMapping(value = "/members", 
					method = RequestMethod.GET, 
					produces = "application/json; charset=utf8")
	public String selectMembers(HttpServletRequest request,
			HttpServletResponse response, MemberVo requestUrl,
			@RequestHeader(value = "Apikey", required = false) String apikey) {
        
        response.setHeader("Access-Control-Allow-Origin", "*");
		Version requestVersion = Version.getVersionByString(requestUrl.getVersion());

		if(apikey == null){
			
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			return memberService.resultWithCode(Code.NO_APIKEY);

		}else if (requestVersion == null) {
			
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_VERSION.getCode(), "API_USE");
			return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
		}

		int viewsCount = memberService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
		if(viewsCount < 0){ //결과가 음수일 경우 코드값
			
			return memberService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			
		}else if(viewsCount == 0){
			
			return memberService.resultWithCode(Code.EXCEEDED_CALL);
		}else{

			switch (requestVersion) {			
				case VERSION_1:
					logService.insertLog(request, "S", apikey, API_SEQ, null, "API_USE");
					memberService.callCount(apikey);
					return gson.toJson(memberService.selectMembers());
					
				case VERSION_2:
					logService.insertLog(request, "S", apikey, API_SEQ, null, "API_USE");
					memberService.callCount(apikey);
					return gson.toJson(memberService.selectMembers(requestUrl.getGender()));				
				
				default:
					logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_VERSION.getCode(), "API_USE");
					response.setStatus(HttpStatus.BAD_REQUEST.value());
					return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
			}
		}			
	}

	/**
	 * 멤버 조회
	 * 
	 * @param memberVo
	 *            {@link MemberVo} 멤버 VO
	 * @return 멤버
	 */
	@RequestMapping(value = "/members/{id}", 
					method = RequestMethod.GET, 
					produces = "application/json; charset=utf8")
	public String selectMember(HttpServletRequest request,
			HttpServletResponse response, MemberVo requestUrl,
			@RequestHeader(value = "Apikey", required = false) String apikey) {

		response.setHeader("Access-Control-Allow-Origin", "*");
		Version requestVersion = Version.getVersionByString(requestUrl.getVersion());
		
		if(apikey == null){
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			return memberService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_VERSION.getCode(), "API_USE");
			return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
			
		}

		int viewsCount = memberService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
		if(viewsCount < 0){ //결과가 음수일 경우 코드값
			
			return memberService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			
		}else if(viewsCount == 0){
			
			return memberService.resultWithCode(Code.EXCEEDED_CALL);
			
		}else{
				
				switch (requestVersion) {
					case VERSION_1:						
						if (memberService.alreadyHasId(requestUrl.getId())) {
							
							logService.insertLog(request, "S", apikey, API_SEQ, null, "API_USE");
							memberService.callCount(apikey);
							return gson.toJson(memberService.selectMember(requestUrl));					
						
						}else{
							
							logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_ID.getCode(), "API_USE");
							response.setStatus(HttpStatus.BAD_REQUEST.value());
							return memberService.resultWithCode(requestUrl, Code.NO_ID);
						}
			
					default:
						logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_VERSION.getCode(), "API_USE");
						response.setStatus(HttpStatus.NOT_FOUND.value());
						return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
					}
		}
	}

	
	/**
	 * 멤버 등록
	 * 
	 * @param memberVo
	 *            {@link MemberVo} 멤버 VO
	 */
	@RequestMapping(value = "/members", 
					method = RequestMethod.POST, 
					produces = "application/json; charset=utf8", consumes = "application/json")
	public String insertMember(HttpServletRequest request,
			HttpServletResponse response, MemberVo requestUrl,
			@RequestBody MemberVo memberVo,
			@RequestHeader(value = "Apikey", required = false) String apikey) {

		response.setHeader("Access-Control-Allow-Origin", "*");
		Version requestVersion = Version.getVersionByString(requestUrl.getVersion());

		if(apikey == null){
			
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			return memberService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_VERSION.getCode(), "API_USE");
			return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
			
		}else{
			
			memberVo.setPassword(Integer.toString(memberVo.getPassword().hashCode())); 
			switch (requestVersion) {
			
				case VERSION_1:					
					if (memberService.alreadyHasId(memberVo.getId())) {
						logService.insertLog(request, "F", apikey, API_SEQ, Code.DUPLICATED_ID.getCode(), "API_USE");
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						return memberService.resultWithCode(memberVo, Code.DUPLICATED_ID);
					} else {
						logService.insertLog(request, "S", apikey, API_SEQ, null, "API_USE");
						memberService.insertMember(memberVo);
						response.setStatus(HttpStatus.CREATED.value());
						return memberService.resultWithCode(memberVo, Code.INSERT_ID);
					}
					
				default:
					logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_VERSION.getCode(), "API_USE");
					response.setStatus(HttpStatus.NOT_FOUND.value());
					return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
			}
		}
	}

	/**
	 * 멤버 삭제
	 * 
	 * @param memberVo
	 *            {@link MemberVo} 멤버 VO
	 */
	@RequestMapping(value = "/members/{id}", 
					method = RequestMethod.DELETE, 
					produces = "application/json; charset=utf8")
	public String deleteMember(HttpServletRequest request,
			HttpServletResponse response, MemberVo requestUrl,
			@RequestHeader(value = "Apikey", required = false) String apikey) {

		response.setHeader("Access-Control-Allow-Origin", "*");
		Version requestVersion = Version.getVersionByString(requestUrl.getVersion());

		if(apikey == null){
			
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			return memberService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_VERSION.getCode(), "API_USE");
			return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
			
		}else{
			
			switch (requestVersion) {			
				case VERSION_1:
					if (memberService.alreadyHasId(requestUrl.getId())) {
						
						logService.insertLog(request, "S", apikey, API_SEQ, null, "API_USE");
						memberService.deleteMember(requestUrl);
						return memberService.resultWithCode(requestUrl, Code.DELETE_ID);
						
					} else {						
						logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_ID.getCode(), "API_USE");
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						return memberService.resultWithCode(requestUrl, Code.NO_ID);
					}
					
				default:
					logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_VERSION.getCode(), "API_USE");
					response.setStatus(HttpStatus.NOT_FOUND.value());
					return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
			}
		}
	}

	/**
	 * 멤버 수정
	 * 
	 * @param memberVo
	 *            {@link MemberVo} 멤버 VO - json 타입으로 받기
	 */

	@RequestMapping(value = "/members/{id}", 
					method = RequestMethod.PUT, 
					produces = "application/json; charset=utf8", 
					consumes = "application/json")
	public String updateMember(HttpServletRequest request,
			HttpServletResponse response, MemberVo requestUrl,
			@RequestBody MemberVo memberVo,
			@RequestHeader(value = "Apikey", required = false) String apikey) {

		response.setHeader("Access-Control-Allow-Origin", "*");
		Version requestVersion = Version.getVersionByString(requestUrl.getVersion());
		
		if(apikey == null){
			
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			return memberService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_VERSION.getCode(), "API_USE");
			return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
			
		}else{

			if (!requestUrl.getId().equals(memberVo.getId())) {
				
				logService.insertLog(request, "F", apikey, API_SEQ, Code.BAD_REQUEST2.getCode(), "API_USE");
				response.setStatus(HttpStatus.BAD_REQUEST.value());
				return memberService.resultWithCode(memberVo, Code.BAD_REQUEST2);
			}

			switch (requestVersion) {			
				case VERSION_1:	
					if (memberService.alreadyHasId(memberVo.getId())) {
						logService.insertLog(request, "S", apikey, API_SEQ, null, "API_USE");
						
						memberService.updateMember(memberVo);
						return memberService.resultWithCode(memberVo, Code.UPDATE_ID);
						
					} else {
						logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_ID.getCode(), "API_USE");
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						return memberService.resultWithCode(memberVo, Code.NO_ID);
					}
					
				default:
					logService.insertLog(request, "F", apikey, API_SEQ, Code.NO_VERSION.getCode(), "API_USE");
					response.setStatus(HttpStatus.NOT_FOUND.value());
					return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
				}
		}
	}
}
