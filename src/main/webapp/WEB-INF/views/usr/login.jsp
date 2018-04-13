<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE>
<html>

<jsp:include page="/WEB-INF/views/document/common/header.jsp" />

<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">로그인</div>
			<div class="card-body">
				<form role="form" method="post" id="loginForm">
					<div class="form-group">
						<label for="exampleInputEmail1">아이디</label> 
						<input class="form-control" name="id"  value="${memberId}" maxlength="10" placeholder="아이디를 입력해주세요.">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">비밀번호</label> 
						<input class="form-control" name="password"type="password" maxlength="10" placeholder="비밀번호를 입력해주세요.">
					</div>
					<div class="modal-footer">
						<input type="hidden" name="currUrl" value="${currUrl}">
						<button type="button" class="btn btn-primary half" onclick="loginFormCommit()">로그인</button>
						<button type="button" class="btn btn-secondary half" data-dismiss="modal" onclick="javascript:history.back()">취소</button>
					</div>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="/usr/register">회원가입</a> 
					<a class="d-block small" href="/usr/findPassword">비밀번호 찾기</a> 
					<a class="d-block small" href="/docs">메인으로 이동</a>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${!empty alert}">
		<script>
			alert("${alert}");
		</script>
	</c:if>
<script src="/js/usrPage.js"></script>	
</body>
</html>