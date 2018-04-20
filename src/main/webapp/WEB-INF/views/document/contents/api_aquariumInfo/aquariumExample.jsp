<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>수족관정보 예제</h2>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
수족관 정보 API 호출 예제입니다.</div>
<div class="separator" style="clear: both; text-align: center;">
본 예제는&nbsp;<a href="https://www.getpostman.com/">postman</a>을 사용하여 API를 호출하였습니다.</div>
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
<b>국내 수족관 정보 API &gt; 데이터 구조 및 예제 &gt; 국내 수족관 정보 API구조</b>&nbsp;</div>
<div class="separator" style="clear: both; text-align: center;">
에서 확인하세요.</div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both;">
<br /></div>
<div class="separator" style="clear: both;">
<br /></div>
<div style="text-align: center;">
<b>1. 수족관 정보 등록</b>&nbsp;</div>
<div style="text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-66WgfYY9N8I/Ws7vbeBTjaI/AAAAAAAAALo/ob3HwXp35tI5YSYu2uCgFXyvH37x-jA3ACLcBGAs/s1600/aqua%2B1GET%2B.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="539" data-original-width="688" height="500" src="https://4.bp.blogspot.com/-66WgfYY9N8I/Ws7vbeBTjaI/AAAAAAAAALo/ob3HwXp35tI5YSYu2uCgFXyvH37x-jA3ACLcBGAs/s640/aqua%2B1GET%2B.jpg" width="90%" style="max-width: 640" /></a></div>
<div class="separator" style="clear: both;">
<b>1.</b>&nbsp;호출 URL (/api/{버전}/aquariums)을 POST로 전송합니다.</div>
<div class="separator" style="clear: both;">
<b>2.</b>&nbsp;헤더 정보로 Content-Type, Apikey를 입력합니다.</div>
<div class="separator" style="clear: both;">
<b>3.&nbsp;</b>등록할 내용을 JSON 형태로 만들어줍니다.</div>
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
<b>2. 모든 수족관 정보 조회&nbsp;</b></div>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-WfKZCLQzJ3c/Ws7vbeQLzfI/AAAAAAAAALs/RbXqzm4b9Dcq14y_k14L7mo1MOLMrwy8QCLcBGAs/s1600/aqua%2B2%2BPOST.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="871" data-original-width="698" height="640" src="https://2.bp.blogspot.com/-WfKZCLQzJ3c/Ws7vbeQLzfI/AAAAAAAAALs/RbXqzm4b9Dcq14y_k14L7mo1MOLMrwy8QCLcBGAs/s640/aqua%2B2%2BPOST.jpg" width="90%" style="max-width: 512" /></a></div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both;">
<b>1.</b>&nbsp;호출 URL (/api/{버전}/aquariums)을 GET로 전송합니다.</div>
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
<div style="text-align: center;">
<b>&nbsp;3. 단일 수족관 정보 조회</b></div>
<div style="text-align: center;">
<b><br /></b></div>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-RnVGC3mFpGQ/Ws7vbZPkEjI/AAAAAAAAALw/FYitoUm6kwESp2w2e8q1AZ713ct8uWX7gCLcBGAs/s1600/aqua%2B3GET%2B.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="421" data-original-width="698" height="386" src="https://3.bp.blogspot.com/-RnVGC3mFpGQ/Ws7vbZPkEjI/AAAAAAAAALw/FYitoUm6kwESp2w2e8q1AZ713ct8uWX7gCLcBGAs/s640/aqua%2B3GET%2B.jpg" width="90%" style="max-width: 640" /></a></div>
<div class="separator" style="clear: both;">
<b>1.</b>&nbsp;호출 URL (/api/{버전}/aquariums/{수족관 일련번호})을 GET으로 전송합니다.</div>
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
<br /></div>
<div style="text-align: center;">
&nbsp;<b>4. 수족관 정보 수정</b></div>
<div style="text-align: center;">
<b><br /></b></div>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-Nckgy8INJ2g/Ws7vcC5mCII/AAAAAAAAAL0/2Ek60Xnbh7Qkoq7I9RJigtzKt1rKc6VkQCLcBGAs/s1600/aqua%2B4%2BPUT%2B.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="578" data-original-width="698" height="528" src="https://3.bp.blogspot.com/-Nckgy8INJ2g/Ws7vcC5mCII/AAAAAAAAAL0/2Ek60Xnbh7Qkoq7I9RJigtzKt1rKc6VkQCLcBGAs/s640/aqua%2B4%2BPUT%2B.jpg" width="90%" style="max-width: 640" /></a></div>
<div class="separator" style="clear: both;">
<b>1.</b>&nbsp;호출 URL (/api/{버전}/aquariums{수족관 일련번호})을 PUT으로 전송합니다.</div>
<div class="separator" style="clear: both;">
<b>2.</b>&nbsp;헤더 정보로 Content-Type, Apikey를 입력합니다.</div>
<div class="separator" style="clear: both;">
<b>3.&nbsp;</b>수정할 내용을 JSON 형태로 만들어줍니다.</div>
<div class="separator" style="clear: both;">
<b>4.</b>&nbsp;데이터 전송 시 결과 메시지를 JSON 형태로 받을 수 있습니다.</div>
<div class="separator" style="clear: both;">
&nbsp; &nbsp;성공 및 실패에 대한 코드 정보는 좌측 메뉴의 오류코드정리를 확인해주세요.</div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<div style="text-align: center;">
<b>&nbsp;5. 수족관 정보 삭제</b></div>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-SynoFWlj9RM/Ws7vcSwvrXI/AAAAAAAAAL4/iBH917fYZ44jKWDbMFFghFNujoqa_CzsgCLcBGAs/s1600/aqua%2B5%2Bdelet.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="484" data-original-width="698" height="442" src="https://2.bp.blogspot.com/-SynoFWlj9RM/Ws7vcSwvrXI/AAAAAAAAAL4/iBH917fYZ44jKWDbMFFghFNujoqa_CzsgCLcBGAs/s640/aqua%2B5%2Bdelet.jpg" width="90%" style="max-width: 640" /></a></div>
<div class="separator" style="clear: both;">
<b>1.</b>&nbsp;호출 URL (/api/{버전}/aquariums{수족관 일련번호})을 DELETE로 전송합니다.</div>
<div class="separator" style="clear: both;">
<b>2.</b>&nbsp;헤더 정보로 Content-Type, Apikey를 입력합니다.</div>
<div class="separator" style="clear: both;">
<b>3.</b>&nbsp;데이터 전송 시 결과 메시지를 JSON 형태로 받을 수 있습니다.</div>
<div class="separator" style="clear: both;">
&nbsp; &nbsp;성공 및 실패에 대한 코드 정보는 좌측 메뉴의 오류코드정리를 확인해주세요.</div>
<div>
