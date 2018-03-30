package com.mskim.backendservice.member.controller;

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
	
	/*@Autowired
	LogService logService;*/
		
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
        
		Version requestVersion = Version.getVersionByString(requestUrl.getVersion());

		if(apikey == null){
			
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return memberService.resultWithCode(Code.NO_APIKEY);

		}else if (requestVersion == null) {
			
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
		}

		int viewsCount = memberService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
		if(viewsCount < 0){ //결과가 음수일 경우 코드값
			
			response.setStatus(HttpStatus.FORBIDDEN.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(Math.abs(viewsCount)).getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return memberService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			
		}else if(viewsCount == 0){
			
			response.setStatus(HttpStatus.FORBIDDEN.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.EXCEEDED_CALL.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return memberService.resultWithCode(Code.EXCEEDED_CALL);
		}else{
			LogVo logInfo;
			switch (requestVersion) {			
				case VERSION_1:
					logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
					request.setAttribute("logInfo", logInfo);					
					memberService.callCount(apikey);
					return gson.toJson(memberService.selectMembers());
					
				case VERSION_2:
					
					if(requestUrl.getGender() == null) {
						
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.BAD_REQUEST_1004.getCode(), "API_USE");
						request.setAttribute("logInfo", logInfo);
						return memberService.resultWithCode(Code.BAD_REQUEST_1004);
						
					}else {
						
						logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
						request.setAttribute("logInfo", logInfo);
						memberService.callCount(apikey);
						return gson.toJson(memberService.selectMembers(requestUrl.getGender()));	
					}
				
				default:
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);					
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

		Version requestVersion = Version.getVersionByString(requestUrl.getVersion());
		
		if(apikey == null){
					
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return memberService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
			
		}

		int viewsCount = memberService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
		if(viewsCount < 0){ //결과가 음수일 경우 코드값
			
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(Math.abs(viewsCount)).getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return memberService.resultWithCode(Code.getCodeByCodeNumber(Math.abs(viewsCount)));
			
		}else if(viewsCount == 0){
			
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.EXCEEDED_CALL.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return memberService.resultWithCode(Code.EXCEEDED_CALL);
			
		}else{
			LogVo logInfo;
				switch (requestVersion) {
					case VERSION_1:						
						if (memberService.alreadyHasId(requestUrl.getId())) {
							
							logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
							request.setAttribute("logInfo", logInfo);
							memberService.callCount(apikey);
							return gson.toJson(memberService.selectMember(requestUrl));					
						
						}else{
							
							logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_ID.getCode(), "API_USE");
							request.setAttribute("logInfo", logInfo);
							response.setStatus(HttpStatus.BAD_REQUEST.value());
							return memberService.resultWithCode(requestUrl, Code.NO_ID);
						}
			
					default:
						logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
						request.setAttribute("logInfo", logInfo);
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

		Version requestVersion = Version.getVersionByString(requestUrl.getVersion());

		if(apikey == null){
			
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return memberService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
			
		}else{
			LogVo logInfo;
			memberVo.setPassword(Integer.toString(memberVo.getPassword().hashCode())); 
			switch (requestVersion) {
			
				case VERSION_1:					
					if (memberService.alreadyHasId(memberVo.getId())) {
						
						logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.DUPLICATED_ID.getCode(), "API_USE");
						request.setAttribute("logInfo", logInfo);
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						return memberService.resultWithCode(memberVo, Code.DUPLICATED_ID);
					} else {
						
						logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
						request.setAttribute("logInfo", logInfo);
						memberService.insertMember(memberVo);
						response.setStatus(HttpStatus.CREATED.value());
						return memberService.resultWithCode(memberVo, Code.INSERT_ID);
					}
					
				default:
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);
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

		Version requestVersion = Version.getVersionByString(requestUrl.getVersion());

		if(apikey == null){
			
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return memberService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
			
		}else{
			LogVo logInfo;
			switch (requestVersion) {			
				case VERSION_1:
					if (memberService.alreadyHasId(requestUrl.getId())) {
						
						logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
						request.setAttribute("logInfo", logInfo);
						memberService.deleteMember(requestUrl);
						return memberService.resultWithCode(requestUrl, Code.DELETE_ID);
						
					} else {	
						logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_ID.getCode(), "API_USE");
						request.setAttribute("logInfo", logInfo);
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						return memberService.resultWithCode(requestUrl, Code.NO_ID);
					}
					
				default:
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);
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

		Version requestVersion = Version.getVersionByString(requestUrl.getVersion());
		
		if(apikey == null){
			
			response.setStatus(HttpStatus.UNAUTHORIZED.value());
			return memberService.resultWithCode(Code.NO_APIKEY);
		
		}else if (requestVersion == null) {
					
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
			
		}else{

			if (!requestUrl.getId().equals(memberVo.getId())) {
				
				LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.BAD_REQUEST_1005.getCode(), "API_USE");
				request.setAttribute("logInfo", logInfo);
				response.setStatus(HttpStatus.BAD_REQUEST.value());
				return memberService.resultWithCode(memberVo, Code.BAD_REQUEST_1005);
			}
			
			LogVo logInfo;
			switch (requestVersion) {
			
				case VERSION_1:	
					if (memberService.alreadyHasId(memberVo.getId())) {
						
						logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
						request.setAttribute("logInfo", logInfo);
						memberService.updateMember(memberVo);
						return memberService.resultWithCode(memberVo, Code.UPDATE_ID);
						
					} else {
						
						logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_ID.getCode(), "API_USE");
						request.setAttribute("logInfo", logInfo);
						response.setStatus(HttpStatus.BAD_REQUEST.value());
						return memberService.resultWithCode(memberVo, Code.NO_ID);
					}
					
				default:
					
					logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
					request.setAttribute("logInfo", logInfo);
					response.setStatus(HttpStatus.NOT_FOUND.value());
					return memberService.resultWithCode(requestUrl, Code.NO_VERSION);
				}
		}
	}
}
