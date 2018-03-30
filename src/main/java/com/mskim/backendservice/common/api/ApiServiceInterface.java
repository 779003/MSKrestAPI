package com.mskim.backendservice.common.api;

import com.mskim.backendservice.common.Code;

public interface ApiServiceInterface {
	
	/**
	 * 요청정보와 코드를 받아 요청에 대한 결과 내용을 코드포함한 JSON 문자열로 출력
	 * 
	 * @param version 요청한 버전
	 * @param code 요청에 해당하는 코드
	 * @return 요청에 대한 결과 내용 JSON 문자열
	 */
	public String resultWithCode(Object apiVo, Code code);
	
	/**
	 * 코드만 받아 요청에 대한 결과 내용을 코드포함한 JSON 문자열로 출력
	 * 
	 * @param code 요청에 해당하는 코드
	 * @return 요청에 대한 결과 내용 JSON 문자열
	 */
	public String resultWithCode(Code code);
	
	/**
	 * API Key 검사,
	 * 일일 API 호출 한도량 검사
	 * 
	 * @param apiKey api키
	 * @param apiSeq api종류 구분 시퀀스
	 * @return 남은 호출량 (음수의 경우 -1 : 잘못된 키, -2 : 권한없음)  
	 */
	public int validityCheck(String apiKey, String apiSeq, String referer);
	
	/**
	 * API 요청 카운트 
	 * @param apiKey api키
	 */
	public void callCount(String apiKey);
	
	/**
	 * 멤버 ID 중복체크
	 * @param memberId {@link String} 멤버 ID
	 * @return 중복이면 true  
	 */
	public boolean alreadyHasValue(String value);
}
