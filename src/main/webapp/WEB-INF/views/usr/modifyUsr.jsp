<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<!DOCTYPE>
<html>
<jsp:include page="/WEB-INF/views/document/common/header.jsp" />
<body class="bg-dark">
	<div class="container">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">회원정보 수정</div>
			<div class="card-body">
				<form id="modifyUsrForm" action="/usr/modify" method="post">
					<div class="form-group">
						<h2> ${memberVo.id} </h2>
						<input type="hidden" name="id" value="${memberVo.id}">
					</div>

					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="inputPassword"><b>비밀번호 변경을 원하시면 입력해주세요.</b></label> 
								<input class="form-control" name="password" type="password" oninput="void(confirmPasswordd())" placeholder="비밀번호를 입력하세요." maxlength="10">
							</div>
							<div class="col-md-6">
								<label for="inputConfirmPassword">비밀번호 확인</label> 
								<input class="form-control" name="confirmPassword" type="password" oninput="void(confirmPasswordd())" placeholder="비밀번호를 한번 더 입력해주세요." maxlength="10">
								<input type="hidden" name="confirmPwdCheck" value=same>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="inputQuestion">비밀번호 찾기 힌트</label> 
								<input class="form-control" value="${memberVo.question}" name="question" placeholder="비밀번호 분실시 찾기 위한 힌트입니다." maxlength="50">
							</div>
							<div class="col-md-6">
								<label for="inputAnswer">비밀번호 찾기 답</label> 
								<input class="form-control" value="${memberVo.answer}" name="answer" placeholder="힌트 답을 적어주세요." maxlength="50">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="inputName">이름</label> 
								<input class="form-control" value="${memberVo.name}" name="name" placeholder="성함을 입력해주세요.">
							</div>
							<div class="col-md-6">
								<label for="inputGender">성별</label> <br>
								<select name="gender">
									<option value="M" <c:if test="${memberVo.gender eq 'M' }">selected</c:if>>남자</option>
									<option value="F" <c:if test="${memberVo.gender eq 'F' }">selected</c:if>>여자</option>
								</select>
							</div>
						</div>
					</div>

					<a class="btn btn-primary btn-block" href="javascript:void(modifyUsrFormCommit())">정보 수정</a>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="javascript:history.back()">이전 페이지로</a> 
				</div>
			</div>
		</div>
		<script src="/js/usrPage.js"></script>
	</div>
</body>
</html>