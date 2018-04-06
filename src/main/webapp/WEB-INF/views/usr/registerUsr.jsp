<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>mskim backend-service 회원가입</title>
  <!-- Bootstrap core CSS-->
  <link href="/bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
    <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">회원가입</div>
      <div class="card-body">
        <form id="registerUsrForm" action="/usr/register" method="POST">
          <div class="form-group">
          </div>
          <div class="form-group">
            <label for="exampleInputEmail1">아이디</label>
            <input class="form-control" id="id" placeholder="아이디를 입력하세요.">
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">비밀번호</label>
                <input class="form-control" id="password" type="password" placeholder="비밀번호를 입력하세요.">
              </div>
              <div class="col-md-6">
                <label for="exampleConfirmPassword">비밀번호 확인</label>
                <input class="form-control" id="ConfirmPassword" type="password" placeholder="비밀번호를 한번 더 입력해주세요.">
              </div>
              <div class="col-md-6">
                <label for="exampleInputPassword1">비밀번호 힌트</label>
                <input class="form-control" id="question" placeholder="비밀번호 분실시 찾기 위한 힌트입니다.">
              </div>
              <div class="col-md-6">
                <label for="exampleConfirmPassword">비밀번호 힌트 답</label>
                <input class="form-control" id="answer" placeholder="힌트 답을 적어주세요.">
              </div>
            </div>
          </div>
          <a class="btn btn-primary btn-block" href="javascript:registerUsr()">회원가입</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="/usr/login">로그인 페이지로</a>
          <a class="d-block small" href="forgot-password.html">비밀번호 찾기</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="/bootstrap/jquery/jquery.min.js"></script>
  <script src="/bootstrap/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="/bootstrap/jquery-easing/jquery.easing.min.js"></script>
  <script>
    function registerUsr(){
    	alert("이따하자");
    }
  </script>
</body>

</body>
</html>