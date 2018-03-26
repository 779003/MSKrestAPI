<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="docContents">
<h2>코드정보</h2>

<p>API 호출 시 발생하는 자체 API코드 및 http 상태코드에 대해 설명합니다.</p> 

<p>NO_VERSION("1001", "유효하지 않은 버전입니다. 버전을 확인해주세요."), <br>
	NO_SERVICE_VERSION("1002", "준비 중인 버전입니다."),  <br>
	NO_ID("1003", "없는 ID입니다."), <br>
	BAD_REQUEST("1004", "요청정보가 잘못되었습니다."), <br>
	BAD_REQUEST2("1005", "요청정보가 잘못되었습니다. URL정보와 body정보가 일치하지않습니다."), <br>
</p><p>	
	/*처리 메시지*/
	DELETE_ID("2001", "아이디 %s를 삭제 했습니다."), <br>
	UPDATE_ID("2002", "아이디 %s를 수정 했습니다."), <br>
	INSERT_ID("2003", "아이디 %s를 생성 했습니다."), <br>
	DUPLICATED_ID("2004", "아이디가 중복됩니다."), <br>
</p><p>	
	/*장애*/
	NOT_FOUND("404", "요청하신 페이지를 찾을 수 없습니다."), <br>
	METHOD_NOT_ALLOWED("405", "요청하신 URL에서 지원하지 않는 HTTP 메소드입니다."), <br>
	UNSUPPORTED_MEDIA_TYPE("415", "요청과 응답은 JSON형식만 지원합니다."), <br>
	INTERNAL_SERVER_ERROR("500", "서버장애가 발생했습니다."), <br>
	BAD_DATA("9001", "입력 데이터가 잘못되었습니다."), <br>
	UNKNOWN_ERROR("9999", "알 수 없는 오류입니다.") <br>
	;</p>

</div>