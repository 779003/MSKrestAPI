<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<center>

	<h1>애플리케이션 수정</h1>
	<div class="tabcontent current">
		<form action="/apps/modify" method="post" id="modifyForm">
			<table class="appInfoTable" style="width: 100%;">
				<tr>
					<th style="width: 30%">애플리케이션 이름</th>
					<td>
						<input style="width: 95%" name="app_name" value="${targetApp.app_name}" maxlength="90">
					</td>
				</tr>
				<tr>
					<th>사용 여부</th>
					<td>
						<input id="useYn_Y" type="radio" name="use_yn" value="Y">
						<label for="useYn_y">사용</label> 
						<input id="useYn_N" type="radio" name="use_yn" value="N"> 
						<label for="useYn_n">중지</label>
					</td>
				</tr>
				<tr>
					<th>사용URL <small>-비 로그인 오픈 API로 등록된 환경에서만 API호출이 가능하도록합니다.</small><br> 
						(빈칸으로 둘 시 모든 환경 접근 허용)
					</th>
					<td>
						http://<input style="width: 80%" name="api_allow" value='${targetApp.api_allow}' maxlength="70">
					</td>
				</tr>
				<tr>
					<th>앱 설명</th>
					<td>
						<input style="width: 95%" name="description" value="${targetApp.description}" maxlength="140">
					</td>
				</tr>
			</table>
			<input type="hidden" name="api_key" value="${targetApp.api_key}">
		</form>
	</div>
	<div class="alert alert-success" role="alert">
		<a href="javascript:modifyApp()">수정하기</a>
	</div>
</center>

<script>
$("#useYn_${targetApp.use_yn}").attr("checked","checked");
</script>
