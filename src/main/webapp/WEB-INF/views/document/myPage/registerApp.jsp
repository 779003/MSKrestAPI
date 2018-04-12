<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<center>
	<h1>애플리케이션 등록 (API 이용신청)</h1>
	API를 사용할 애플리케이션 정보를 입력하시면 인증Key를 발급해드립니다. <br> 
	인증Key는 API서비스 이용허가를	받은 사람임을 식별할 수 있도록 사용자에게 개별적으로 할당하는 고유한 값입니다.
	<div class="tabcontent current">
		<form action="/apps/register" method="post" id="registerForm">
			<table class="appInfoTable" style="width: 100%;">
				<tr>
					<th>애플리케이션 이름</th>
					<td>
						<input style="width: 95%" name="app_name" maxlength="90">
					</td>
				</tr>
				<tr>
					<th style="width: 30%">사용 API</th>
					<td>
						<select name="api_seq">
							<c:forEach var="api" items="${api_list}" varStatus="status">
								<option value="${api.api_seq}">${api.api_name_kor}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>사용URL <small>-비 로그인 오픈 API로 등록된 환경에서만 API호출이 가능하도록합니다.</small><br> 
						(빈칸으로 둘 시 모든 환경 접근 허용)
					</th>
					<td>
						http://<input style="width: 80%" name="api_allow" maxlength="70">
					</td>
				</tr>
				<tr>
					<th>앱 설명</th>
					<td>
						<input style="width: 95%" name="description" maxlength="140">
					</td>
				</tr>
			</table>
			<div class="alert alert-success" role="alert">
				<a href="javascript:registApp()">등록하기</a>
			</div>
		</form>
	</div>
</center>
