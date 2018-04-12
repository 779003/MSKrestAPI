<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="docContents">
	<h2>코드정보</h2>

	<p>
		본 서비스는 처리 결과 및 장애에 대한 코드와 설명을 제공합니다.<br> 
		아래 내용에서 확인하세요.
	</p>
	<br> <br> <br> <br>
	<table border=1>
		<tr>
			<th colspan="3">코드 정보</th>
		</tr>
		<tr>
			<th style="width: 10%">코드 번호</th>
			<th style="width: 20%">코드 이름</th>
			<th>내용</th>
		</tr>
		<tr>
			<td colspan="3">기본</td>
		</tr>
		<tr>
			<td>200</td>
			<td>OK</td>
			<td>작업을 성공하였습니다.</td>
		</tr>
		<tr>
			<td>1001</td>
			<td>NO_RESULT</td>
			<td>조회 결과가 없습니다.</td>
		</tr>
		<tr>
			<td>1002</td>
			<td>NO_RESULT_WITH_VALUE</td>
			<td>[검색어] 로 조회한 결과가 없습니다.</td>
		</tr>
		<tr>
			<td>1003</td>
			<td>EXCEDED_CALL</td>
			<td>일일 허용량을 초과하였습니다.</td>
		</tr>
		<tr>
			<td>1004</td>
			<td>NO_VALUE</td>
			<td>해당 정보가 없습니다.</td>
		</tr>
		<tr>
			<td>1005</td>
			<td>NO_VALUE_UPDATE</td>
			<td>수정하려는 원본 정보가 없습니다.</td>
		</tr>
		<tr>
			<td>1006</td>
			<td>NO_VALUE_DELETE</td>
			<td>삭제하려는 원본 정보가 없습니다.</td>
		</tr>
		<tr>
			<td colspan="3">장애 관련</td>
		</tr>
		<tr>
			<td>400</td>
			<td>BAD_REQUEST</td>
			<td>잘못된 요청입니다.</td>
		</tr>
		<tr>
			<td>404</td>
			<td>NOT_FOUND</td>
			<td>요청하신 페이지를 찾을 수 없습니다.</td>
		</tr>
		<tr>
			<td>405</td>
			<td>METHOD_NOT_ALLOWED</td>
			<td>요청하신 URL에서 지원하지 않는 HTTP메소드 입니다.</td>
		</tr>
		<tr>
			<td>415</td>
			<td>UNSUPPORTED_MEDIA_TYPE</td>
			<td>요청과 응답은 JSON 형식만 지원합니다.</td>
		</tr>
		<tr>
			<td>500</td>
			<td>INTERNAL_SERVER_ERROR</td>
			<td>서버장애가 발생했습니다.</td>
		</tr>
		<tr>
			<td>2001</td>
			<td>INVALID_KEY</td>
			<td>호출하려는 서비스에서 사용할 수 없는 키입니다. APP정보에서 사용여부가 미사용이거나 다른 API를 위한
				KEY인지 확인해주세요.</td>
		</tr>
		<tr>
			<td>2002</td>
			<td>NO_REFERER</td>
			<td>등록된 어플리케이션에서는 접근권한 설정이 되어있지만 본 api를 호출하는 서비스에서 정보를 찾을 수
				없습니다. 본 서비스에서 API호출을 사용하기 원한다면 어플리케이션의 접근설정을 모두 허용해야 합니다.</td>
		</tr>
		<tr>
			<td>2003</td>
			<td>NOT_ALLOWED</td>
			<td>접근 설정된 URL과 호출하는 서비스 URL이 일치하지 않습니다.</td>
		</tr>
		<tr>
			<td>2004</td>
			<td>BAD_DATA</td>
			<td>입력 데이터가 잘못되었습니다.</td>
		</tr>
		<tr>
			<td>2005</td>
			<td>NO_APIKEY</td>
			<td>API KEY가 누락되었습니다. 헤더에 API KEY 정보가 포함되어야 합니다.</td>
		</tr>
		<tr>
			<td>2999</td>
			<td>UNKNOWN_ERROR</td>
			<td>알 수 없는 오류입니다.</td>
		</tr>
		<tr>
			<td colspan="3">파라미터 문제</td>

		</tr>
		<tr>
			<td>3001</td>
			<td>NO_VERSION</td>
			<td>유효하지 않은 버전입니다. 버전을 확인해주세요.</td>
		</tr>
		<tr>
			<td>3002</td>
			<td>NO_SERVICE_VERSION</td>
			<td>준비 중인 버전입니다.</td>
		</tr>
		<tr>
			<td>3003</td>
			<td>BAD_REQUEST_3003</td>
			<td>요청정보가 잘못되었습니다.</td>
		</tr>
		<tr>
			<td>3004</td>
			<td>BAD_REQUEST_3004</td>
			<td>요청정보가 잘못되었습니다. URL정보와 Body정보가 일치하지 않습니다.</td>
		</tr>
		<tr>
			<td>3005</td>
			<td>BAD_REQUEST_3005</td>
			<td>요청 정보가 부족합니다. 부족한 항목 : [항목이름]</td>
		</tr>
		<tr>
			<td>3006</td>
			<td>BAD_REQUEST_3006</td>
			<td>요청 정보가 부족합니다.</td>
		</tr>
		<tr>
			<td colspan="3">처리메시지 - 공동</td>
		</tr>
		<tr>
			<td>4001</td>
			<td>DELETE</td>
			<td>삭제가 완료되었습니다.</td>
		</tr>
		<tr>
			<td>4002</td>
			<td>UPDATE</td>
			<td>수정이 완료되었습니다.</td>
		</tr>
		<tr>
			<td>4003</td>
			<td>INSERT</td>
			<td>생성이 완료되었습니다.</td>
		</tr>
		<tr>
			<td colspan="3">처리 메시지 - 회원 관리 API</td>
		</tr>
		<tr>
			<td>5001</td>
			<td>DELETE_ID</td>
			<td>아이디 [아이디]를 삭제했습니다.</td>
		</tr>
		<tr>
			<td>5002</td>
			<td>UPDATE_ID</td>
			<td>아이디 [아이디]를 수정했습니다.</td>
		</tr>
		<tr>
			<td>5003</td>
			<td>INSERT_ID</td>
			<td>아이디 [아이디]를 생성했습니다.</td>
		</tr>
		<tr>
			<td>5004</td>
			<td>DUPLICATED_ID</td>
			<td>아이디가 중복됩니다.</td>
		</tr>
		<tr>
			<td>5005</td>
			<td>NO_ID</td>
			<td>해당 아이디가 없습니다.</td>
		</tr>
		<tr>
			<td colspan="3">처리메시지 - 관상어 정보</td>
		</tr>
		<tr>
			<td>6001</td>
			<td>DUPLICATED_FISH</td>
			<td>물고기 이름이 중복됩니다.</td>
		</tr>
	</table>

</div>