package com.mskim.backendservice.common;

import lombok.Getter;

/**
 * 코드정보 enum
 */
@Getter
public enum Code {
	
		/*파라미터 문제*/
	NO_VERSION("1001", "유효하지 않은 버전입니다. 버전을 확인해주세요."), 
	NO_SERVICE_VERSION("1002", "준비 중인 버전입니다."), 
	NO_ID("1003", "없는 ID입니다."),
	BAD_REQUEST_1004("1004", "요청정보가 잘못되었습니다."),
	BAD_REQUEST_1005("1005", "요청정보가 잘못되었습니다. URL정보와 body정보가 일치하지않습니다."),
	
		/*처리 메시지*/
	/*Member*/
	DELETE_ID("2001", "아이디 %s를 삭제 했습니다."),
	UPDATE_ID("2002", "아이디 %s를 수정 했습니다."),
	INSERT_ID("2003", "아이디 %s를 생성 했습니다."),
	DUPLICATED_ID("2004", "아이디가 중복됩니다."),
	EXCEEDED_CALL("2005", "일일 허용량을 초과하였습니다."),
	
		/*장애*/
	BAD_REQUEST("400", "잘못된 요청입니다."),
	NOT_FOUND("404", "요청하신 페이지를 찾을 수 없습니다."),
	METHOD_NOT_ALLOWED("405", "요청하신 URL에서 지원하지 않는 HTTP 메소드입니다."),
	UNSUPPORTED_MEDIA_TYPE("415", "요청과 응답은 JSON형식만 지원합니다."),
	INTERNAL_SERVER_ERROR("500", "서버장애가 발생했습니다."),
	INVALID_KEY("8001", "호출하려는 서비스에서 사용할 수 없는 키입니다. APP정보를 확인해주세요. 사용여부가 미사용이거나 다른 API를 위한 KEY인지 확인해주세요."),
	NO_REFERER("8002", "본 API를 호출하는 서비스에서 정보가 없습니다. 본 서비스에서 API호출을 사용하기 원하면 APP의 접근설정을 모두 허용 해야합니다."),
	NOT_ALLOWED("8003", "접근 설정한 URL과 호출하는 서비스 URL이 일치하지 않습니다."),
	BAD_DATA("9001", "입력 데이터가 잘못되었습니다."),
	NO_APIKEY("9002", "API KEY가 누락되었습니다. 해더에 API KEY정보 포함되어야합니다."),
	UNKNOWN_ERROR("9999", "알 수 없는 오류입니다.")
	;
	
	private final String code;
	private final String message;

	
	private Code(String code, String message) {
		this.code = code;
		this.message = message;
	}
	
	/**
	 * 코드 정보 문자열로 출력
	 * @return <b>예)</b> 준비 중인 버전입니다. (code : 102)
	 */
	@Override
	public String toString(){
		return this.message +"(code: " + this.code + ")";
	}
	
	/**
	 * 코드번호를 받아 {@link Code} 리턴
	 */
	public static Code getCodeByCodeNumber(int codeNumber){
		System.out.println("codeNumber : " +codeNumber );
		
		for(Code getCode : values()){
			if(getCode.code.equals(String.valueOf(codeNumber))){
				return getCode;
			}
		}
		return Code.UNKNOWN_ERROR;
	}
}
