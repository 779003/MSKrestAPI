<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<jsp:include page="/WEB-INF/views/document/common/header.jsp" />
<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">비밀번호 찾기</div>
			<div class="card-body">
				<div class="text-center mt-4 mb-5">
					<h4>비밀번호 찾기</h4>
					<p>아이디를 입력하시면 회원가입시 입력한 질문 답으로 비밀번호를 찾습니다.</p>
				</div>
				<form id="findPasswordForm" action="/usr/question" method="post">
					<div class="form-group">
						<input class="form-control" name="memberId" placeholder="아이디를 입력해주세요." maxlength="10">
					</div>
					<a class="btn btn-primary btn-block" href="javascript:findPasswordFormCommit()">아이디 입력</a>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="/usr/register">회원가입</a> 
					<a class="d-block small" href="/usr/login">로그인 하기</a>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${!empty alert}">
		<script>
			alert("${alert}");
		</script>
	</c:if>
</body>
</html>