<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>관상어api 예제</h2>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
관상어 정보 API 호출 예제입니다.</div>
<div class="separator" style="clear: both; text-align: center;">
본 예제는 <a href="https://www.getpostman.com/">postman</a>을 사용하여 API를 호출하였습니다.</div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
API를 호출하는데 필요한 내용만 확인하시고&nbsp;</div>
<div class="separator" style="clear: both; text-align: center;">
사용하시고자 하는 어플리케이션에 맞게 적용해보세요.</div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
본 API의 구조는&nbsp;</div>
<div class="separator" style="clear: both; text-align: center;">
<b>관상어 정보 API &gt; 데이터 구조 및 예제 &gt; 관상어 정보API구조&nbsp;</b></div>
<div class="separator" style="clear: both; text-align: center;">
에서 확인하세요.</div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<b>1. 관상어 정보 등록</b></div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-95czP14FOaU/Ws7vYuUOmoI/AAAAAAAAALY/kJ_ETOJ0iUsJIfjaGogkIHKkBxtXhqYrQCLcBGAs/s1600/fish1%2Bpost.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="668" data-original-width="698" height="612" src="https://2.bp.blogspot.com/-95czP14FOaU/Ws7vYuUOmoI/AAAAAAAAALY/kJ_ETOJ0iUsJIfjaGogkIHKkBxtXhqYrQCLcBGAs/s640/fish1%2Bpost.jpg" width="640" /></a></div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: left;">
<b>1.</b> 호출 URL (/api/{버전}/fish)을 POST로 전송합니다.</div>
<div class="separator" style="clear: both; text-align: left;">
<b>2.</b> 헤더 정보로 Content-Type, Apikey를 입력합니다.</div>
<div class="separator" style="clear: both; text-align: left;">
<b>3. </b>등록할 내용을 JSON 형태로 만들어줍니다.</div>
<div class="separator" style="clear: both; text-align: left;">
<b>4.</b> 데이터 전송 시 결과 메시지를 JSON 형태로 받을 수 있습니다.</div>
<div class="separator" style="clear: both; text-align: left;">
&nbsp; &nbsp;성공 및 실패에 대한 코드 정보는 좌측 메뉴의 오류코드정리를 확인해주세요.</div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<b>2. 모든 관상어 정보 조회</b></div>
<br />
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-Y6gvdY16ffY/Ws7vYzsR33I/AAAAAAAAALc/yNUOLE7fp6g1liGKAB9FWLyuHZDpWQVTQCLcBGAs/s1600/fish2%2Bget.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="720" data-original-width="711" height="640" src="https://2.bp.blogspot.com/-Y6gvdY16ffY/Ws7vYzsR33I/AAAAAAAAALc/yNUOLE7fp6g1liGKAB9FWLyuHZDpWQVTQCLcBGAs/s640/fish2%2Bget.jpg" width="632" /></a></div>
<div class="separator" style="clear: both;">
<b>1.</b>&nbsp;호출 URL (/api/{버전}/fish)을 GET으로 전송합니다.</div>
<div class="separator" style="clear: both;">
<b>2.</b>&nbsp;헤더 정보로 Content-Type, Apikey를 입력합니다.</div>
<div class="separator" style="clear: both;">
<b>3.</b>&nbsp;데이터 전송 시 결과 메시지를 JSON 형태로 받을 수 있습니다.</div>
<div class="separator" style="clear: both;">
&nbsp; &nbsp;성공 및 실패에 대한 코드 정보는 좌측 메뉴의 오류코드정리를 확인해주세요.</div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<b>3. 단일 관상어 조회</b></div>
<br />
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-tfrF7_Q6ECU/Ws7vYkWCeyI/AAAAAAAAALU/dfOZVyz3p3oYWWoqRATitTXGZ_vLk9ShACLcBGAs/s1600/fish3%2Bget.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="420" data-original-width="711" height="378" src="https://2.bp.blogspot.com/-tfrF7_Q6ECU/Ws7vYkWCeyI/AAAAAAAAALU/dfOZVyz3p3oYWWoqRATitTXGZ_vLk9ShACLcBGAs/s640/fish3%2Bget.jpg" width="640" /></a></div>
<div class="separator" style="clear: both;">
<b>1.</b>&nbsp;호출 URL (/api/{버전}/fish/{물고기 일련번호})을 GET으로 전송합니다.</div>
<div class="separator" style="clear: both;">
<b>2.</b>&nbsp;헤더 정보로 Content-Type, Apikey를 입력합니다.</div>
<div class="separator" style="clear: both;">
<b>3.</b>&nbsp;데이터 전송 시 결과 메시지를 JSON 형태로 받을 수 있습니다.</div>
<div class="separator" style="clear: both;">
&nbsp; &nbsp;성공 및 실패에 대한 코드 정보는 좌측 메뉴의 오류코드정리를 확인해주세요.</div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<b>4. 관상어 정보 수정</b></div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-OfOvqriK3vc/Ws7vZVdWIRI/AAAAAAAAALg/dFMmK8EfrvoUls0tA1WrLWGMHe5DlV7UwCLcBGAs/s1600/fish4%2Bput.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="682" data-original-width="711" height="612" src="https://3.bp.blogspot.com/-OfOvqriK3vc/Ws7vZVdWIRI/AAAAAAAAALg/dFMmK8EfrvoUls0tA1WrLWGMHe5DlV7UwCLcBGAs/s640/fish4%2Bput.jpg" width="640" /></a></div>
<div class="separator" style="clear: both;">
<b>1.</b>&nbsp;호출 URL (/api/{버전}/fish{수정할 관상어 일련번호})을 PUT으로 전송합니다.</div>
<div class="separator" style="clear: both;">
<b>2.</b>&nbsp;헤더 정보로 Content-Type, Apikey를 입력합니다.</div>
<div class="separator" style="clear: both;">
<b>3.&nbsp;</b>수정할 내용을 JSON 형태로 만들어줍니다.</div>
<div class="separator" style="clear: both;">
<b>4.</b>&nbsp;데이터 전송 시 결과 메시지를 JSON 형태로 받을 수 있습니다.</div>
<div class="separator" style="clear: both;">
&nbsp; &nbsp;성공 및 실패에 대한 코드 정보는 좌측 메뉴의 오류코드정리를 확인해주세요.</div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both;">
<br /></div>
<div style="text-align: center;">
<b>&nbsp;5. 관상어 정보 삭제</b></div>
<div style="text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-E-5gUPZCmfs/Ws7vZjgl1sI/AAAAAAAAALk/pNezqA1EOyg7pJv8I6VH-rwG44lMhCp5QCLcBGAs/s1600/fish5%2Bdelete.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="468" data-original-width="711" height="420" src="https://1.bp.blogspot.com/-E-5gUPZCmfs/Ws7vZjgl1sI/AAAAAAAAALk/pNezqA1EOyg7pJv8I6VH-rwG44lMhCp5QCLcBGAs/s640/fish5%2Bdelete.jpg" width="640" /></a></div>
<div class="separator" style="clear: both;">
<b>1.</b>&nbsp;호출 URL (/api/{버전}/fish/{관상어 일련번호})을 DELETE로 전송합니다.</div>
<div class="separator" style="clear: both;">
<b>2.</b>&nbsp;헤더 정보로 Content-Type, Apikey를 입력합니다.</div>
<div class="separator" style="clear: both;">
<b>3.</b>&nbsp;데이터 전송 시 결과 메시지를 JSON 형태로 받을 수 있습니다.</div>
<div class="separator" style="clear: both;">
&nbsp; &nbsp;성공 및 실패에 대한 코드 정보는 좌측 메뉴의 오류코드정리를 확인해주세요.</div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both;">
</div>