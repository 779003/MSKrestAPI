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
@RequestMapping(value = "/api/{version}/admin")
public class MemberController{

	static final String API_SEQ ="1";

	/**
	 * {@link MemberService} 멤버 Service
	 */
	@Autowired
	MemberService memberService;
			
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
			HttpServletResponse response, MemberVo parameterVo,
			@RequestHeader(value = "Apikey", required = false) String apikey) {
        
		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());
		
		LogVo logInfo;
		switch (requestVersion) {
		case VERSION_1:
			logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
			request.setAttribute("logInfo", logInfo);
			memberService.callCount(apikey);
			return gson.toJson(memberService.selectMembers());

		case VERSION_2:
			if (parameterVo.getGender() == null) {

				response.setStatus(HttpStatus.BAD_REQUEST.value());
				logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.BAD_REQUEST_3003.getCode(), "API_USE");
				request.setAttribute("logInfo", logInfo);
				return memberService.resultWithCode(Code.BAD_REQUEST_3003);

			} else {

				logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
				request.setAttribute("logInfo", logInfo);
				memberService.callCount(apikey);
				return gson.toJson(memberService.selectMembers(parameterVo.getGender()));
			}

		default:
			logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			return memberService.resultWithCode(parameterVo, Code.NO_VERSION);
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
			HttpServletResponse response, MemberVo parameterVo,
			@RequestHeader(value = "Apikey", required = false) String apikey) {

		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());

		LogVo logInfo;
		switch (requestVersion) {
		case VERSION_1:
			if (memberService.alreadyHasValue(parameterVo.getId())) {

				logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
				request.setAttribute("logInfo", logInfo);
				memberService.callCount(apikey);
				return gson.toJson(memberService.selectMember(parameterVo.getId()));

			} else {

				logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_ID.getCode(), "API_USE");
				request.setAttribute("logInfo", logInfo);
				response.setStatus(HttpStatus.BAD_REQUEST.value());
				return memberService.resultWithCode(parameterVo, Code.NO_ID);
			}

		default:
			logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			response.setStatus(HttpStatus.NOT_FOUND.value());
			return memberService.resultWithCode(parameterVo, Code.NO_VERSION);
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
			HttpServletResponse response, MemberVo parameterVo,
			@RequestBody MemberVo memberVo,
			@RequestHeader(value = "Apikey", required = false) String apikey) {

		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());
		
		String missingField = memberService.dataMissingCheck(memberVo);
		if (!missingField.equals("")) {
			
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.BAD_REQUEST_3006.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return memberService.resultWithCode(missingField, Code.BAD_REQUEST_3005);
		}

		int notValidKeyCode = memberService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
		if (notValidKeyCode < 0) { // 결과가 음수일 경우 코드값

			int codeNumber = Math.abs(notValidKeyCode);
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(codeNumber).getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			response.setStatus(HttpStatus.FORBIDDEN.value());
			return memberService.resultWithCode(Code.getCodeByCodeNumber(codeNumber));
		}

		LogVo logInfo;
		switch (requestVersion) {
		
		case VERSION_1:
			if (memberService.alreadyHasValue(memberVo.getId())) {

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
			return memberService.resultWithCode(parameterVo, Code.NO_VERSION);
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
			HttpServletResponse response, MemberVo parameterVo,
			@RequestHeader(value = "Apikey", required = false) String apikey) {

		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());

		int notValidKeyCode = memberService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
		if (notValidKeyCode < 0) { // 결과가 음수일 경우 코드값

			int codeNumber = Math.abs(notValidKeyCode);
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(codeNumber).getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			response.setStatus(HttpStatus.FORBIDDEN.value());
			return memberService.resultWithCode(Code.getCodeByCodeNumber(codeNumber));

		}

		LogVo logInfo;
		switch (requestVersion) {
		case VERSION_1:
			if (memberService.alreadyHasValue(parameterVo.getId())) {

				logInfo = new LogVo(apikey, API_SEQ, "SUCCESS", null, "API_USE");
				request.setAttribute("logInfo", logInfo);
				memberService.deleteMember(parameterVo);
				return memberService.resultWithCode(parameterVo, Code.DELETE_ID);

			} else {
				logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_ID.getCode(), "API_USE");
				request.setAttribute("logInfo", logInfo);
				response.setStatus(HttpStatus.BAD_REQUEST.value());
				return memberService.resultWithCode(parameterVo, Code.NO_ID);
			}

		default:
			logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.NO_VERSION.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			response.setStatus(HttpStatus.NOT_FOUND.value());
			return memberService.resultWithCode(parameterVo, Code.NO_VERSION);
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
			HttpServletResponse response, MemberVo parameterVo,
			@RequestBody MemberVo memberVo,
			@RequestHeader(value = "Apikey", required = false) String apikey) {

		Version requestVersion = Version.getVersionByString(parameterVo.getVersion());
		
		String missingField = memberService.dataMissingCheck(memberVo);
		if (!missingField.equals("") || missingField.equals("member_id")) { // 수정시 id는 입력받지 않기 때문

			response.setStatus(HttpStatus.BAD_REQUEST.value());
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.BAD_REQUEST_3006.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			return memberService.resultWithCode(missingField, Code.BAD_REQUEST_3005);
		}

		if (!parameterVo.getId().equals(memberVo.getId())) {

			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.BAD_REQUEST_3004.getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			response.setStatus(HttpStatus.BAD_REQUEST.value());
			return memberService.resultWithCode(memberVo, Code.BAD_REQUEST_3004);
		}
		
		int notValidKeyCode = memberService.validityCheck(apikey, API_SEQ, request.getHeader("referer"));
		if (notValidKeyCode < 0) { // 결과가 음수일 경우 코드값

			int codeNumber = Math.abs(notValidKeyCode);
			LogVo logInfo = new LogVo(apikey, API_SEQ, "FAILURE", Code.getCodeByCodeNumber(codeNumber).getCode(), "API_USE");
			request.setAttribute("logInfo", logInfo);
			response.setStatus(HttpStatus.FORBIDDEN.value());
			return memberService.resultWithCode(Code.getCodeByCodeNumber(codeNumber));
		}

		LogVo logInfo;
		switch (requestVersion) {
		case VERSION_1:
			if (memberService.alreadyHasValue(memberVo.getId())) {

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
			return memberService.resultWithCode(parameterVo, Code.NO_VERSION);
		}
	}
}
