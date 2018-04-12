<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="docContents">
	<h2>오픈API사용 방법</h2>

	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		오픈API 사용 방법입니다.</div>
	<br />
	<div class="separator" style="clear: both; text-align: center;">
		<a
			href="https://3.bp.blogspot.com/-8rhuXA_GYaU/Ws6rDR9t8bI/AAAAAAAAAK4/CY9Ml0gssoYcr0xA02xIUUZ2sFOcALG7wCLcBGAs/s1600/guide_useApi1.jpg"
			imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
			border="0" data-original-height="704" data-original-width="1581"
			height="284"
			src="https://3.bp.blogspot.com/-8rhuXA_GYaU/Ws6rDR9t8bI/AAAAAAAAAK4/CY9Ml0gssoYcr0xA02xIUUZ2sFOcALG7wCLcBGAs/s640/guide_useApi1.jpg"
			width="640" /></a>
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		1. 생성된 애플리케이션 정보를 확인합니다.</div>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: left;">
		<b>1) API Key : </b>오픈API를 호출하기 위한 어플리케이션의 고유한 값입니다.&nbsp;
	</div>
	<div class="separator" style="clear: both; text-align: left;">
		타인에게 노출되지 않도록 주의해주세요.</div>
	<div class="separator" style="clear: both; text-align: left;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: left;">
		<b>2) 사용 여부 : </b>사용여부가<b> [사용중]&nbsp;</b>일때에만 해당 API Key로 오픈API를 호출 할
		수 있습니다.&nbsp;
	</div>
	<div class="separator" style="clear: both; text-align: left;">
		사용 중단을 원하신다면<b> [수정하기]</b> 버튼을 클릭하여 사용 중단해주세요.
	</div>
	<div class="separator" style="clear: both; text-align: left;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: left;">
		<b>3) 허용 URL : </b>허용 URL을 등록 할 경우 등록되지 않은 URL에서만 본 오픈API를 호출 하실 수
		있습니다. URL 비교는 요청 헤더의 referer값을 비교하며, 오픈API를 호출하는 곳에서 referer값을 보내지 않을
		경우에도 오픈API 사용이 제한됩니다.
	</div>
	<div class="separator" style="clear: both; text-align: left;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: left;">
		<b>4) 오픈 API 일일 사용량 :</b> 본 서비스는 일일 사용량을 제한합니다. 오픈 API 호출시마다 1씩 증가하며
		하루 허용량이 초과하는 경우 다음날까지 사용이 중단됩니다.
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<blockquote class="tr_bq" style="clear: both; text-align: center;">
		<br />아직 애플리케이션을 생성하지 않았다면<br />좌측 메뉴의 OpenAPI 사용방법 &gt; 키 발급
		페이지를&nbsp; 참고하여<br />애플리케이션을 생성해 주세요.
	</blockquote>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<br />
	<div class="separator" style="clear: both; text-align: center;">
		<a
			href="https://1.bp.blogspot.com/-UnlRtI5cOZg/Ws6rBBm4qpI/AAAAAAAAAKk/5KHqbXjcC98rHcgRYYvuCYAxZ6C29ox8QCLcBGAs/s1600/K-009.jpg"
			imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
			border="0" data-original-height="454" data-original-width="965"
			height="300"
			src="https://1.bp.blogspot.com/-UnlRtI5cOZg/Ws6rBBm4qpI/AAAAAAAAAKk/5KHqbXjcC98rHcgRYYvuCYAxZ6C29ox8QCLcBGAs/s640/K-009.jpg"
			width="640" /></a>
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		위는 오픈API 호출 예제입니다.</div>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		요청 시 메소드를 지정하고 헤더 정보로 Content-Type, ApiKey를 추가하여&nbsp;</div>
	<div class="separator" style="clear: both; text-align: center;">
		필요한 데이터를 불러와 물고기 앨범을 만들었습니다.&nbsp;</div>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<blockquote class="tr_bq" style="clear: both; text-align: center;">
		각 API 마다의 사용법은 우측 메뉴에 각 API 메뉴를 참고해 주세요.</blockquote>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: center;">
	</div>
	<br />
	<div class="separator" style="clear: both; text-align: center;">
		<a
			href="https://3.bp.blogspot.com/-fCvyXoZM9ho/Ws6rBIRwDkI/AAAAAAAAAKg/mMqqijKGVXgSvWnazForjGWSb_p39VHjACLcBGAs/s1600/WIN_20180412_01_04_20_Pro.jpg"
			imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
			border="0" data-original-height="1031" data-original-width="531"
			height="320"
			src="https://3.bp.blogspot.com/-fCvyXoZM9ho/Ws6rBIRwDkI/AAAAAAAAAKg/mMqqijKGVXgSvWnazForjGWSb_p39VHjACLcBGAs/s320/WIN_20180412_01_04_20_Pro.jpg"
			width="164" /></a>
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<div class="separator" style="clear: both; text-align: center;">
		OpenAPI를 사용하여 위보다 멋진 서비스를 만드세요.</div>
	<div class="separator" style="clear: both; text-align: center;">
		<br />
	</div>
	<br />
</div>