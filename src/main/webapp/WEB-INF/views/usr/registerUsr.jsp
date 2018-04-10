<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<jsp:include page="/WEB-INF/views/document/common/header.jsp" />
<body class="bg-dark">
	<div class="container">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">회원가입</div>
			<div class="card-body">
				<form id="registerUsrForm" action="/usr/register" method="post">
					<div class="form-group">
						<label for="inputID">아이디</label> 
						<input class="form-control" name="id" id="id" placeholder="아이디를 입력하세요." onchange="void(validCheckId())" maxlength="10">
						<input type="hidden" name="duplicationIdCheck" value="duplication">
					</div>

					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="inputPassword">비밀번호</label> 
								<input class="form-control" name="password" type="password" oninput="void(confirmPasswordd())" placeholder="비밀번호를 입력하세요." maxlength="10">
							</div>
							<div class="col-md-6">
								<label for="inputConfirmPassword">비밀번호 확인</label> 
								<input class="form-control" name="confirmPassword" type="password" oninput="void(confirmPasswordd())" placeholder="비밀번호를 한번 더 입력해주세요." maxlength="10">
								<input type="hidden" name="confirmPwdCheck" value=NotSame>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="inputQuestion">비밀번호 찾기 힌트</label> 
								<input class="form-control" name="question" placeholder="비밀번호 분실시 찾기 위한 힌트입니다." maxlength="50">
							</div>
							<div class="col-md-6">
								<label for="inputAnswer">비밀번호 찾기 답</label> 
								<input class="form-control" name="answer" placeholder="힌트 답을 적어주세요." maxlength="50">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="inputName">이름</label> 
								<input class="form-control" name="name" placeholder="성함을 입력해주세요.">
							</div>
							<div class="col-md-6">
								<label for="inputGender">성별</label> <br>
								<select name="gender">
									<option value="M">남자</option>
									<option value="F">여자</option>
								</select>
							</div>
						</div>
					</div>

					<a class="btn btn-primary btn-block" href="javascript:void(registerUsrFormCommit())">회원가입</a>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="/usr/login">로그인 페이지로</a> 
					<a class="d-block small" href="/usr/findPassword">비밀번호 찾기</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>