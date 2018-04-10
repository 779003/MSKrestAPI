<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<jsp:include page="/WEB-INF/views/document/common/header.jsp" />

<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">비밀번호 찾기 - 질문 확인</div>
			<div class="card-body">
				<div class="text-center mt-4 mb-5">
					<h2>
						<b>${memberId}</b>
					</h2>
					<h4>질문의 답을 적어주세요.</h4>
					<p>회원가입시 입력했던 질문과 답으로 비밀번호를 찾습니다.</p>
				</div>
				<form id="questionForm" action="/usr/answer" method="post">
					<input class="form-control" name="id" value="${memberId}" type="hidden">
					<div class="form-group">
						<input class="form-control" name="question" value="${question}" readonly="readonly">
					</div>
					<div class="form-group">
						<input class="form-control" name="answer" placeholder="질문의 답을 입력해주세요.">
					</div>
					<a class="btn btn-primary btn-block" href="javascript:questionFormCommit()">비밀번호 초기화</a>
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