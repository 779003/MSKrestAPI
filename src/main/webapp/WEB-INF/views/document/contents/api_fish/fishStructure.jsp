<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>관상어 정보 api 구조</h2>
<div align="center">
<table>
	<colgroup style="max-width:165"></colgroup>
	<colgroup style="max-width:126"></colgroup>
	<colgroup style="max-width:134"></colgroup>
	<colgroup style="max-width:104"></colgroup>
	<colgroup span="3" style="max-width:166"></colgroup>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">API 명</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" colspan=2 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 정보</font></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">담당자</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="left" valign=middle><font face="DejaVu Sans" color="#000000">김민수</font></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">권한</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" align="left" valign=middle><font face="DejaVu Sans" color="#000000">관리자</font></td>
	</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">데이터 타입</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">메소드</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="center" valign=middle><font color="#000000">GET / POST / PUT / DELETE</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="23" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">작성일</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle sdval="43199" sdnum="1033;1033;M/D/YYYY"><font color="#000000">4/9/2018</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">수정일</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle sdval="43202" sdnum="1033;1033;M/D/YYYY"><font color="#000000">4/12/2018</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="center" valign=middle><font color="#000000"><br></font></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="33" align="center" valign=middle bgcolor="#8EB4E3"><b><font face="DejaVu Sans" color="#000000">기능</font></b></td>
		</tr>
	<tr>
		<td style="border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">개요</font></b></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 정보를 다루는 API</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" rowspan=2 height="45" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 rowspan=2 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 정보를 등록, 수정, 삭제, 조회를 한다.<br></font></td>
		</tr>
	<tr>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="33" align="center" valign=middle bgcolor="#8EB4E3"><b><font face="DejaVu Sans" color="#000000">필수 헤더</font></b></td>
		</tr>
	<tr>
		<td style="border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" rowspan=3 height="67" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">파라미터</font></b></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">파라미터 명</font></b></td>
		<td style="border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=5 align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">내용</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">Content-Type</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=5 align="left" valign=middle><font color="#000000">application/json  </font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">ApiKey</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=5 align="left" valign=middle><font face="DejaVu Sans" color="#000000">API를 호출하기위한 API Key로 관리자 센터에서 발급</font></td>
		</tr>
	<tr>
		<td height="23" align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="center" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="33" align="center" valign=middle bgcolor="#8EB4E3"><b><font face="DejaVu Sans" color="#000000">메소드 별 호출 정보</font></b></td>
		</tr>
	<tr>
		<td height="23" align="center" valign=middle><b><font color="#000000"><br></font></b></td>
		<td align="center" valign=middle><b><font color="#000000"><br></font></b></td>
		<td align="center" valign=middle><b><font color="#000000"><br></font></b></td>
		<td align="center" valign=middle><b><font color="#000000"><br></font></b></td>
		<td align="center" valign=middle><b><font color="#000000"><br></font></b></td>
		<td align="center" valign=middle><b><font color="#000000"><br></font></b></td>
		<td align="center" valign=middle><b><font color="#000000"><br></font></b></td>
	</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">메소드</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font color="#000000">GET (1)</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">모든 관상어 정보 조회</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="25" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">권한</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">일반 사용자</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font color="#000000">URL</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font color="#000000">/api/{version}/fish</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="23" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">버전 정보</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=5 align="left" valign=middle><font face="DejaVu Sans" color="#000000">모든 관상어 정보를 조회</font></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="33" align="center" valign=middle bgcolor="#8EB4E3"><b><font face="DejaVu Sans" color="#000000">매개 변수 정보</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="22" align="left" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">입력 인자</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">매개 변수 명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">적용 버전</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">전송 형태</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">필수 여부</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">version</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">파라미터</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">호출할 API의 버전</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="22" align="left" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">출력 인자</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">매개 변수 명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">적용 버전</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">데이터 형태</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_seq</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 일련번호</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_name</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 이름</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_imgurl</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 이미지 URL</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_content</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 설명</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="23" align="center" valign=middle><font color="#000000">orgn_url</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">원본 URL</font></td>
		</tr>
	<tr>
		<td height="23" align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="center" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">메소드</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font color="#000000">GET (2)</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">단일 관상어 정보 조회</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="25" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">권한</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">일반 사용자</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font color="#000000">URL</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">/api/{version}/fish/{관상어 일련번호}</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="23" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">버전 정보</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=5 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 일련번호를 입력하여 해당하는 관상어 정보 조회</font></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="33" align="center" valign=middle bgcolor="#8EB4E3"><b><font face="DejaVu Sans" color="#000000">매개 변수 정보</font></b></td>
		</tr>
	<tr>
		<td style="border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="22" align="left" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">입력 인자</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">매개 변수 명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">적용 버전</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">전송 형태</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">필수 여부</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">version</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">파라미터</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">호출할 API의 버전</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_seq</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">파라미터</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 일련번호</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="22" align="left" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">출력 인자</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">매개 변수 명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">적용 버전</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">데이터 형태</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_seq</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 일련번호</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_name</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 이름</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_imgurl</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 이미지 URL</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_content</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 설명</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="23" align="center" valign=middle><font color="#000000">orgn_url</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">원본 URL</font></td>
		</tr>
	<tr>
		<td height="23" align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="center" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">메소드</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font color="#000000">POST</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 정보 등록</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="25" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">권한</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관리자</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font color="#000000">URL</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font color="#000000">/api/{version}/fish</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="23" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">버전 정보</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=5 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 정보를 입력 받아 관상어 정보를 저장</font></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="33" align="center" valign=middle bgcolor="#8EB4E3"><b><font face="DejaVu Sans" color="#000000">매개 변수 정보</font></b></td>
		</tr>
	<tr>
		<td style="border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="22" align="left" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">입력 인자</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">매개 변수 명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">적용 버전</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">전송 형태</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">필수 여부</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">version</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">파라미터</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 일련번호</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_name</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 이름</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_imgurl</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 이미지 URL</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_content</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 설명</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">orgn_url</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">원본 URL</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="22" align="left" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">출력 인자</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">매개 변수 명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">적용 버전</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">데이터 형태</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">version</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">호출한 API의 버전</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">code</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">결과 코드 번호</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">message</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">코드의 내용</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="23" align="center" valign=middle><font color="#000000">information</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">자세한 코드정보 링크</font></td>
		</tr>
	<tr>
		<td height="23" align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="center" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">메소드</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font color="#000000">PUT</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 정보 수정</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="25" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">권한</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관리자</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font color="#000000">URL</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">/api/{version}/fish/{관상어 일련번호}</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="23" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">버전 정보</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=5 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 일련번호를 지정하고 수정할 정보를 입력하여 정보 수정</font></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="33" align="center" valign=middle bgcolor="#8EB4E3"><b><font face="DejaVu Sans" color="#000000">매개 변수 정보</font></b></td>
		</tr>
	<tr>
		<td style="border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="22" align="left" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">입력 인자</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">매개 변수 명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">적용 버전</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">전송 형태</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">필수 여부</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">version</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">파라미터</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">호출할 API의 버전</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_seq</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">파라미터</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 일련번호 *URL 파라미터</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_seq</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 일련번호 *JSON 데이터</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_name</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 이름</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_imgurl</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 이미지 URL</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_content</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 설명</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">orgn_url</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">원본 URL</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="22" align="left" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">출력 인자</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">매개 변수 명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">적용 버전</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">데이터 형태</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">version</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">호출한 API의 버전</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">code</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">결과 코드 번호</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">message</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">코드의 내용</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="23" align="center" valign=middle><font color="#000000">information</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">자세한 코드정보 링크</font></td>
		</tr>
	<tr>
		<td height="23" align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="center" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
		<td align="left" valign=middle><font color="#000000"><br></font></td>
	</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">메소드</font></b></td>
		<td style="border-top: 2px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font color="#000000">DELETE</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">단일 관상어 정보 삭제</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="25" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">권한</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관리자</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font color="#000000">URL</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=6 align="left" valign=middle><font face="DejaVu Sans" color="#000000">/api/{version}/fish/{관상어 일련번호}</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="23" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">버전 정보</font></b></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=5 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 일련번호를 파라미터로 입력받아 해당하는 관상어 정보 삭제</font></td>
		</tr>
	<tr>
		<td style="border-top: 2px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="33" align="center" valign=middle bgcolor="#8EB4E3"><b><font face="DejaVu Sans" color="#000000">매개 변수 정보</font></b></td>
		</tr>
	<tr>
		<td style="border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="22" align="left" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">입력 인자</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">매개 변수 명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">적용 버전</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">전송 형태</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">필수 여부</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">version</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">파라미터</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">호출할 API의 버전</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">fish_seq</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">파라미터</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000" align="center" valign=middle><font face="DejaVu Sans" color="#000000">필수</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=3 align="left" valign=middle><font face="DejaVu Sans" color="#000000">관상어 일련번호</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 2px solid #000000" colspan=7 height="22" align="left" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">출력 인자</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">매개 변수 명</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">적용 버전</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">데이터 형태</font></b></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="center" valign=middle bgcolor="#C6D9F1"><b><font face="DejaVu Sans" color="#000000">설명</font></b></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">version</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">호출한 API의 버전</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">code</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">결과 코드 번호</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="22" align="center" valign=middle><font color="#000000">message</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">코드의 내용</font></td>
		</tr>
	<tr>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 2px solid #000000; border-right: 1px solid #000000" height="23" align="center" valign=middle><font color="#000000">information</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">v1</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000" align="center" valign=middle><font color="#000000">JSON</font></td>
		<td style="border-top: 1px solid #000000; border-bottom: 2px solid #000000; border-left: 1px solid #000000; border-right: 2px solid #000000" colspan=4 align="left" valign=middle><font face="DejaVu Sans" color="#000000">자세한 코드정보 링크</font></td>
		</tr>
</table>
</div>
